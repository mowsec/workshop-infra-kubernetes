import os
import re
import subprocess
import base64
from typing import Optional

from fastapi import FastAPI, Header, HTTPException
from kubernetes import client, config
from kubernetes.client import ApiException

API_KEY = os.getenv("API_KEY", "change-me")
WORKDIR = os.getenv("WORKDIR", "/cargo-cats")  
NS_PREFIX = os.getenv("NS_PREFIX", "demo")

app = FastAPI(title="Workshop Deployer API", version="1.0.0")

try:
    config.load_incluster_config()
except Exception:
    try:
        config.load_kube_config()
    except Exception:
        pass

core = client.CoreV1Api()

def detect_namespace():
    try:
        with open("/var/run/secrets/kubernetes.io/serviceaccount/namespace") as f:
            return f.read().strip()
    except FileNotFoundError:
        pass
    #fallback to default    
    return "default"

def get_secret_value(secret_name: str, key: str) -> str:
    secret = core.read_namespaced_secret(secret_name, detect_namespace())
    encoded_value = secret.data.get(key)
    if not encoded_value:
        raise KeyError(f"Key '{key}' not found in secret '{secret_name}'")
    return base64.b64decode(encoded_value).decode("utf-8")

def require_api_key(x_api_key: Optional[str]):
    if x_api_key != API_KEY:
        raise HTTPException(status_code=401, detail="Invalid API key")


def set_env_variable(env, namespace):
    env["NAMESPACE"] = namespace
    env["CONTRAST__UNIQ__NAME"] = namespace
    try:
        env["CONTRAST__AGENT__TOKEN"] = get_secret_value("contrast-agent-secret", "token")
        env["CONTRAST__API__KEY"] = get_secret_value("contrast-api-secret", "api_key")
        env["CONTRAST__API__AUTHORIZATION"] = get_secret_value("contrast-api-secret", "auth_header")
    except Exception as e:
        print(f"Error retrieving contrast-agent-secret: {e}")

    return env

def find_next_namespace(prefix: str) -> str:
    pattern = re.compile(rf"^{re.escape(prefix)}(\d+)$")
    max_n = 0
    try:
        ns_list = core.list_namespace()
        for ns in ns_list.items:
            name = ns.metadata.name or ""
            m = pattern.match(name)
            if m:
                try:
                    n = int(m.group(1))
                    if n > max_n:
                        max_n = n
                except ValueError:
                    continue
    except ApiException as e:
        raise HTTPException(status_code=500, detail=f"Kubernetes API error: {e}")

    return f"{prefix}{max_n + 1}"


@app.post("/workshops/next")
def create_next_workshop(x_api_key: Optional[str] = Header(None)):
    require_api_key(x_api_key)

    next_ns = find_next_namespace(NS_PREFIX)

    env = os.environ.copy()
    env = set_env_variable(env, next_ns)


    try:
        result = subprocess.run(
            ["make", "demo-up"],
            cwd=WORKDIR,
            capture_output=True,
            text=True,
            check=True,
            env=env,
        )
        return {
            "status": "ok",
            "namespace": next_ns,
            "stdout": result.stdout,
        }
    except subprocess.CalledProcessError as e:
        raise HTTPException(status_code=500, detail={
            "namespace": next_ns,
            "stderr": e.stderr,
            "returncode": e.returncode,
        })

@app.post("/workshops/create")
def create_next_workshop(x_api_key: Optional[str] = Header(None), namespace: Optional[str] = None):
    require_api_key(x_api_key)

    if namespace is None:
        raise HTTPException(status_code=500, detail=f"'namespace' parameter is required")

    env = os.environ.copy()
    env = set_env_variable(env, namespace)

    try:
        result = subprocess.run(
            ["make", "demo-up"],
            cwd=WORKDIR,
            capture_output=True,
            text=True,
            check=True,
            env=env,
        )
        return {
            "status": "ok",
            "namespace": namespace,
            "stdout": result.stdout,
        }
    except subprocess.CalledProcessError as e:
        raise HTTPException(status_code=500, detail={
            "namespace": namespace,
            "stderr": e.stderr,
            "returncode": e.returncode,
        })

@app.delete("/workshops/delete")
def delete_workshop(x_api_key: Optional[str] = Header(None), namespace: Optional[str] = None):
    require_api_key(x_api_key)

    if namespace is None:
        raise HTTPException(status_code=500, detail=f"'namespace' parameter is required")


    try:
        result = subprocess.run(
            ["kubectl", "delete", "namespace", namespace],
            cwd=WORKDIR,
            capture_output=True,
            text=True,
            check=True,
        )
        return {
            "status": "ok",
            "namespace": namespace,
            "stdout": result.stdout,
        }
    except subprocess.CalledProcessError as e:
        raise HTTPException(status_code=500, detail={
            "namespace": namespace,
            "stderr": e.stderr,
            "returncode": e.returncode,
        })


@app.get("/healthz")
def healthz():
    return {"status": "ok"}
