
```
helm upgrade --install prometheus prometheus-community/prometheus --set prometheus-node-exporter.hostRootFsMount.enabled=false
```

--set prometheus-node-exporter.hostRootFsMount.enabled=false
# is needed to avoid permission issues on macOS with Docker Desktop
