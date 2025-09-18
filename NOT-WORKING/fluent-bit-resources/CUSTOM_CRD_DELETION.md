Removing all CRDS that Fluent Operator creates is a manual procesS: 

https://www.reddit.com/r/kubernetes/comments/hdjdw8/how_to_cleanup_crds_from_a_dead_operator/


```shell
kubectl get crd -o name | grep fluent | xargs kubectl delete
customresourcedefinition.apiextensions.k8s.io "clusterfilters.fluentbit.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "clusterfilters.fluentd.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "clusterfluentbitconfigs.fluentbit.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "clusterfluentdconfigs.fluentd.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "clusterinputs.fluentbit.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "clusterinputs.fluentd.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "clustermultilineparsers.fluentbit.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "clusteroutputs.fluentbit.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "clusteroutputs.fluentd.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "clusterparsers.fluentbit.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "collectors.fluentbit.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "filters.fluentbit.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "filters.fluentd.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "fluentbitconfigs.fluentbit.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "fluentbits.fluentbit.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "fluentdconfigs.fluentd.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "fluentds.fluentd.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "inputs.fluentd.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "multilineparsers.fluentbit.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "outputs.fluentbit.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "outputs.fluentd.fluent.io" deleted
customresourcedefinition.apiextensions.k8s.io "parsers.fluentbit.fluent.io" deleted
```



If you have a stuck finalizer on the FluentBit resource, you can remove it with:
1. ❯ kubectl patch -n fluent FluentBit fluent-bit -p '{"metadata":{"finalizers":[]}}' --type=merge
2. ❯ kubectl get crd -o name | grep fluent | xargs kubectl delete
3. ❯ kubectl delete namespace fluent                                                               
