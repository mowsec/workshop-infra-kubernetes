

1. Install the vCluster CLI tool
   https://www.vcluster.com/docs/vcluster/
   ```shell
    brew install loft-sh/tap/vcluster-experimental
    ``` 

2. Create a vCluster
    ```shell
    vcluster create demo-1 --namespace demo-1 --values vcluster.yaml
    ```

3. Connect to the vCluster (this should happen automatically after creation) 
   so maybe just check your current kube context: 
    ```shell
    kubectl config current-context
    -> vcluster_demo-1_demo-1_docker-desktop
    ```

    If you need to connect again later, use:
    ```shell
    vcluster connect demo-1
    ```

4. Switch to the cargo-cats repo and deploy the demo app: 
    ```shell
    make deploy
    ```

4. To create a 2nd demo environment, we can do: 
    ```shell
    vcluster disconnect
    vcluster create demo-2 --namespace demo-2 --values vcluster.yaml
    ```

5. To delete the VClusters: 
    ```shell
    vcluster delete demo-1 --namespace
    vcluster delete demo-2 --namespace
    ```

# Issues
1. In a vCluster, fluent-bit cannot access the host's log files located at `var/log/containers` because the vCluster does not have access to the host's filesystem. 
   - A workaround could be to run fluent-bit on each node of the host cluster, which can access the log files directly, and then forward the log for each vcluster to OpenSearch in each vcluster. However, this has the same issues with namespaced fluentbits
   - Another issue is that logging from the host also has issues which require enterprise features to resolve: 
   > If you don't configure host path mapping, log collectors such as Loki, ELK, and Fluentd incorrectly resolve logs for vCluster pods.
   https://www.vcluster.com/docs/vcluster/configure/vcluster-yaml/control-plane/components/host-path-mapper
   - We might be able to share /var/log/containers via a volume mount, but this has the same problem as then all vclusters would see all logs from all workshop users. :shaking-angry-fist:

The fluentbit pod fails to start with the following error:
```shell
kubectl logs -n demo-1 contrast-cargo-cats-fluent-bit-bm42n
failed to try resolving symlinks in path "/var/log/pods/demo-1_contrast-cargo-cats-fluent-bit-bm42n-x-demo-1-x-demo-1_c1731a61-392a-4593-aca9-6ebbb662a5c5/fluent-bit/6.log": lstat /var/log/pods/demo-1_contrast-cargo-cats-fluent-bit-bm42n-x-demo-1-x-demo-1_c1731a61-392a-4593-aca9-6ebbb662a5c5/fluent-bit/6.log: no such file or directory%   
```

2. A second Nginx controller in the second vCluster fails to get an external IP of localhost: 
```shell
contrast-cargo-cats-ingress-nginx-controller             LoadBalancer   10.110.103.173   <pending>     80:31357/TCP,443:32230/TCP
```
