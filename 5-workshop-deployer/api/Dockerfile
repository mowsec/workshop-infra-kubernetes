FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
      make curl ca-certificates gnupg git && \
    rm -rf /var/lib/apt/lists/*

RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

RUN curl -L -o /usr/local/bin/kubectl \
      "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x /usr/local/bin/kubectl

WORKDIR /app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY app ./app
RUN git clone -b workshop-setup https://github.com/mowsec/cargo-cats.git /cargo-cats
#COPY ./cargo-cats /cargo-cats

ENV PYTHONUNBUFFERED=1

EXPOSE 8080
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
