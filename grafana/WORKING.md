This works and enables LOKI log aggregation to populate Grafana dashboards.

I've been using this to debug log streams that aren't working in OpenSearch, since Grafana is less fussy. 

To set up Grafana: 
```shell
# Install Loki Via Helm
helm upgrade --install loki grafana/loki -f grafana/values.yaml

# Install Grafana Via Helm
helm install grafana grafana/grafana

```

Also prometheus for metrics: 
```shell
helm upgrade --install  prometheus prometheus-community/prometheus --set prometheus-node-exporter.hostRootFsMount.enabled=false
```
