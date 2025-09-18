

### Issues flushing lots of logs 
- `mem buf overlimit` reported on the re_emmitted_xxxxx, which is not happening on others because I have set the memBugLimit 

```log
level=info time=2025-09-16T09:33:38Z msg="No fluent-bit secret yaml found, using classic one."
level=info time=2025-09-16T09:33:38Z msg="fluent-bit watcher started"
Fluent Bit v4.0.1
* Copyright (C) 2015-2025 The Fluent Bit Authors
* Fluent Bit is a CNCF sub-project under the umbrella of Fluentd
* https://fluentbit.io

______ _                  _    ______ _ _             ___  _____ 
|  ___| |                | |   | ___ (_) |           /   ||  _  |
| |_  | |_   _  ___ _ __ | |_  | |_/ /_| |_  __   __/ /| || |/' |
|  _| | | | | |/ _ \ '_ \| __| | ___ \ | __| \ \ / / /_| ||  /| |
| |   | | |_| |  __/ | | | |_  | |_/ / | |_   \ V /\___  |\ |_/ /
\_|   |_|\__,_|\___|_| |_|\__| \____/|_|\__|   \_/     |_(_)___/ 


[2025/09/16 09:33:38] [ info] [fluent bit] version=4.0.1, commit=b12e507090, pid=14
[2025/09/16 09:33:38] [ info] [storage] ver=1.5.3, type=memory, sync=normal, checksum=off, max_chunks_up=128
[2025/09/16 09:33:38] [ info] [simd    ] disabled
[2025/09/16 09:33:38] [ info] [cmetrics] version=1.0.0
[2025/09/16 09:33:38] [ info] [ctraces ] version=0.6.4
[2025/09/16 09:33:38] [ info] [input:systemd:systemd.0] initializing
[2025/09/16 09:33:38] [ info] [input:systemd:systemd.0] storage_strategy='memory' (memory only)
[2025/09/16 09:33:38] [ warn] [input:systemd:systemd.0] seek_cursor failed
[2025/09/16 09:33:38] [ info] [input:tail:tail.1] initializing
[2025/09/16 09:33:38] [ info] [input:tail:tail.1] storage_strategy='memory' (memory only)
[2025/09/16 09:33:38] [ info] [input:tail:tail.1] multiline core started
[2025/09/16 09:33:38] [ info] [input:tail:tail.1] db: delete unmonitored stale inodes from the database: count=26
[2025/09/16 09:33:38] [ info] [filter:kubernetes:kubernetes.1] https=1 host=kubernetes.default.svc port=443
[2025/09/16 09:33:38] [ info] [filter:kubernetes:kubernetes.1]  token updated
[2025/09/16 09:33:38] [ info] [filter:kubernetes:kubernetes.1] local POD info OK
[2025/09/16 09:33:38] [ info] [filter:kubernetes:kubernetes.1] host: kubernetes.default.svc Wait 30 secs until DNS starts up (1/6)
[2025/09/16 09:34:08] [ info] [filter:kubernetes:kubernetes.1] testing connectivity with API server...
[2025/09/16 09:34:08] [ info] [filter:kubernetes:kubernetes.1] connectivity OK
[2025/09/16 09:34:08] [ info] [input:emitter:re_emitted_3f13fd6485d6450a50e28c5a777902a8] initializing
[2025/09/16 09:34:08] [ info] [input:emitter:re_emitted_3f13fd6485d6450a50e28c5a777902a8] storage_strategy='memory' (memory only)
[2025/09/16 09:34:08] [ info] [output:loki:loki.0] configured, hostname=loki-gateway.default.svc.cluster.local:80
[2025/09/16 09:34:08] [ info] [output:loki:loki.2] configured, hostname=loki-gateway.default.svc.cluster.local:80
[2025/09/16 09:34:08] [ info] [http_server] listen iface=0.0.0.0 tcp_port=2020
[2025/09/16 09:34:08] [ info] [sp] stream processor started
[2025/09/16 09:34:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=527951 watch_fd=1 name=/var/log/containers/coredns-668d6bf9bc-9gsf6_kube-system_coredns-7ee1a039a63dd32b0a5a16027766217c6d1c8f6f23ed8583794fb7323bebcd98.log
[2025/09/16 09:34:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=527486 watch_fd=2 name=/var/log/containers/coredns-668d6bf9bc-zrmbg_kube-system_coredns-eeaea171badbeb1072379f4187e68e9e0f34401e3ed2846fefba7fadc36914e2.log
[2025/09/16 09:34:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=101468 watch_fd=3 name=/var/log/containers/kube-apiserver-docker-desktop_kube-system_kube-apiserver-a8e8315278717189b3b8f4e29e20e83e3aa7d308fb53241f92b893fdff9aed98.log
[2025/09/16 09:34:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=526686 watch_fd=4 name=/var/log/containers/kube-proxy-rxrxs_kube-system_kube-proxy-ef9eeba305a22de6fefeb01aa4f1c282a76a753e5a1f0430fef712ea7e1634c2.log
[2025/09/16 09:34:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=527852 watch_fd=5 name=/var/log/containers/loki-chunks-cache-0_default_memcached-cb97f237f613b61a2dfbda628c7176fac300f74a772c3333b694ab1e3dd84898.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=527570 watch_fd=6 name=/var/log/containers/loki-results-cache-0_default_memcached-2014019e8fb129670372dcffc49632c86865f0ee24b75af6b624d91444f15c82.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=527380 watch_fd=7 name=/var/log/containers/prometheus-kube-state-metrics-d4fd85895-5sfnv_default_kube-state-metrics-7ccebea05f998b1ac9ee1bb6fa42ac014b97976d25ffadc8386545fae3d05949.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=526778 watch_fd=8 name=/var/log/containers/prometheus-prometheus-node-exporter-srhzs_default_node-exporter-11dd411a89ebdd07c9a5aa669804361320eb99068d33242d51fc19e8530b028a.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=527915 watch_fd=9 name=/var/log/containers/prometheus-prometheus-pushgateway-65ddfcc6c4-52jz8_default_pushgateway-62991228ea7885d92e1003ab402fa7ce01927ef1ea1c966196076fd6dc18989c.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=527860 watch_fd=10 name=/var/log/containers/prometheus-server-5d877c6bb8-9xt4x_default_prometheus-server-configmap-reload-cc3cd0a6d40d0e79430b89e55d5f335f53f898dcc9883f5d673722c72c82520c.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inode=140 link_rotated: /var/log/containers/simulation-console-exploit-server-7b64fd69fc-ftr2v_demo-5_exploit-server-413f5fc564736746080ea4a92400a4a323dbb15705398a9827de362ac7e3eb47.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inode=528291 handle rotation(): /var/log/containers/simulation-console-exploit-server-7b64fd69fc-ftr2v_demo-5_exploit-server-413f5fc564736746080ea4a92400a4a323dbb15705398a9827de362ac7e3eb47.log => /var/lib/docker/containers/413f5fc564736746080ea4a92400a4a323dbb15705398a9827de362ac7e3eb47/413f5fc564736746080ea4a92400a4a323dbb15705398a9827de362ac7e3eb47-json.log (deleted)
[2025/09/16 09:34:09] [error] [/src/fluent-bit/plugins/in_tail/tail_fs_inotify.c:147 errno=2] No such file or directory
[2025/09/16 09:34:09] [error] [input:tail:tail.1] inode=528291 cannot register file /var/lib/docker/containers/413f5fc564736746080ea4a92400a4a323dbb15705398a9827de362ac7e3eb47/413f5fc564736746080ea4a92400a4a323dbb15705398a9827de362ac7e3eb47-json.log (deleted)
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=527320 watch_fd=11 name=/var/log/containers/contrast-cargo-cats-db-66546bc8dd-49zrz_demo-5_mysql-46a53442855fccd86e5e5ff006c3125f89b80c2984781aefcf7b913350a55a2b.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=101474 watch_fd=12 name=/var/log/containers/etcd-docker-desktop_kube-system_etcd-1e827e7ba3435ed9971293b228a799aafb7e9b1a1b0c4a5dddd4f675862b8b34.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=527132 watch_fd=13 name=/var/log/containers/grafana-6dfc59b867-vzwt5_default_grafana-49527856a42da348a6606e57ae4b4f156053f66adb8e306131969c291cbee3db.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=13126 watch_fd=14 name=/var/log/containers/kube-controller-manager-docker-desktop_kube-system_kube-controller-manager-3895d1cd5b2306560ed5fbb844994c182f6b1b09deeca6e95088421f61e8bd7e.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=97786 watch_fd=15 name=/var/log/containers/kube-scheduler-docker-desktop_kube-system_kube-scheduler-92862f8bcced2e23a23350ca2ad068d2d70730eab25f80d70248ba3183407bfd.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=526930 watch_fd=16 name=/var/log/containers/loki-0_default_loki-8073878f19c38b68aaa5d3ec9e51710d7ab1c5832067b517aa35a4751baac164.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=526800 watch_fd=17 name=/var/log/containers/loki-canary-22hxd_default_loki-canary-87aa2f176d7aa20b135468410acc9ef662d9839f27252d2899fa7d65e0053bf6.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=528139 watch_fd=18 name=/var/log/containers/loki-gateway-c5fb897b8-s7zwk_default_nginx-afdeb9b9d84d4aa7d73622078280ae5625bf34630fb9f724e6d0a049570a23e7.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=528319 watch_fd=19 name=/var/log/containers/loki-minio-0_default_minio-451a7af866c3f4a0ebded6f267f33e4dd2883188ea51b6d08d84e7a68e0e7962.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=527424 watch_fd=20 name=/var/log/containers/prometheus-alertmanager-0_default_alertmanager-24d2fd933214fbe36e03d9540194613cfdfccf19a3a18ea59b11edbca57bff3b.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=527965 watch_fd=21 name=/var/log/containers/simulation-console-console-ui-6f5dd5f546-sd5cg_demo-5_console-ui-25c66bffb10ce4887d294e4910d8964de2934d5812912f8821c892b56bb4d2d0.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=527404 watch_fd=22 name=/var/log/containers/storage-provisioner_kube-system_storage-provisioner-d45b008de0fc713622e8b9eb1d5292cd8572d1470c2de3343f6bf90aebb0c7ef.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=526352 watch_fd=23 name=/var/log/containers/vpnkit-controller_kube-system_vpnkit-controller-28f98d72c96b2851a05967216ca376580d13e11bcc435b17ea279a060142db2f.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=528464 watch_fd=24 name=/var/log/containers/fluent-bit-gmfkn_fluent_fluent-bit-345186cead1e0b73615251121db2b00e4f6f2133de710c2069ed31d048cc5ad3.log
[2025/09/16 09:34:09] [ info] [input:tail:tail.1] inotify_fs_add(): inode=528569 watch_fd=25 name=/var/log/containers/simulation-console-contrastdatacollector-9c756655-c744c_demo-5_contrastdatacollector-b89a865b7b1e82f9d1ef9f159d618e875cd43d75ad8180e8b32daa8d5672dd88.log
[2025/09/16 09:34:09] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:09] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:09] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:09] [ warn] [engine] failed to flush chunk '14-1758015248.924692333.flb', retry in 10 seconds: task_id=1, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:09] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:09] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:09] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:09] [ warn] [engine] failed to flush chunk '14-1758015248.916941083.flb', retry in 6 seconds: task_id=0, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:09] [ warn] [engine] failed to flush chunk '14-1758015248.935199542.flb', retry in 11 seconds: task_id=2, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:09] [ warn] [engine] failed to flush chunk '14-1758015248.944552250.flb', retry in 8 seconds: task_id=3, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:09] [ warn] [engine] failed to flush chunk '14-1758015248.953147583.flb', retry in 7 seconds: task_id=4, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:09] [ warn] [engine] failed to flush chunk '14-1758015248.965986000.flb', retry in 8 seconds: task_id=5, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:09] [ warn] [engine] failed to flush chunk '14-1758015249.58509333.flb', retry in 8 seconds: task_id=12, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=opensearch.1 (out_id=1)
[2025/09/16 09:34:09] [ warn] [engine] failed to flush chunk '14-1758015249.58543375.flb', retry in 11 seconds: task_id=13, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=opensearch.1 (out_id=1)
[2025/09/16 09:34:09] [ warn] [engine] failed to flush chunk '14-1758015249.58581708.flb', retry in 9 seconds: task_id=14, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=opensearch.1 (out_id=1)
[2025/09/16 09:34:10] [error] [net] TCP connection failed: loki-gateway.default.svc.cluster.local:80 (Connection refused)
[2025/09/16 09:34:10] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:10] [ warn] [engine] failed to flush chunk '14-1758015249.44655208.flb', retry in 11 seconds: task_id=11, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:11] [error] [net] TCP connection failed: loki-gateway.default.svc.cluster.local:80 (Connection refused)
[2025/09/16 09:34:11] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:11] [ warn] [engine] failed to flush chunk '14-1758015249.441921459.flb', retry in 10 seconds: task_id=15, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:12] [error] [net] TCP connection failed: loki-gateway.default.svc.cluster.local:80 (Connection refused)
[2025/09/16 09:34:12] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:12] [ warn] [engine] failed to flush chunk '14-1758015250.503897709.flb', retry in 7 seconds: task_id=16, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:13] [error] [net] TCP connection failed: loki-gateway.default.svc.cluster.local:80 (Connection refused)
[2025/09/16 09:34:13] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:13] [ warn] [engine] failed to flush chunk '14-1758015252.415700960.flb', retry in 8 seconds: task_id=19, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:14] [error] [net] TCP connection failed: loki-gateway.default.svc.cluster.local:80 (Connection refused)
[2025/09/16 09:34:14] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:14] [ warn] [engine] failed to flush chunk '14-1758015252.485470460.flb', retry in 6 seconds: task_id=20, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:15] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:15] [ warn] [engine] failed to flush chunk '14-1758015254.958346295.flb', retry in 9 seconds: task_id=24, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:16] [error] [net] TCP connection failed: loki-gateway.default.svc.cluster.local:80 (Connection refused)
[2025/09/16 09:34:16] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:16] [error] [engine] chunk '14-1758015248.916941083.flb' cannot be retried: task_id=0, input=tail.1 > output=loki.2
[2025/09/16 09:34:17] [error] [engine] chunk '14-1758015249.58509333.flb' cannot be retried: task_id=12, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=opensearch.1
[2025/09/16 09:34:17] [error] [net] TCP connection failed: loki-gateway.default.svc.cluster.local:80 (Connection refused)
[2025/09/16 09:34:17] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:17] [error] [engine] chunk '14-1758015248.953147583.flb' cannot be retried: task_id=4, input=tail.1 > output=loki.2
[2025/09/16 09:34:18] [error] [engine] chunk '14-1758015249.58581708.flb' cannot be retried: task_id=14, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=opensearch.1
[2025/09/16 09:34:18] [error] [net] TCP connection failed: loki-gateway.default.svc.cluster.local:80 (Connection refused)
[2025/09/16 09:34:18] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:18] [error] [engine] chunk '14-1758015248.965986000.flb' cannot be retried: task_id=5, input=tail.1 > output=loki.2
[2025/09/16 09:34:19] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:19] [error] [engine] chunk '14-1758015250.503897709.flb' cannot be retried: task_id=16, input=tail.1 > output=loki.2
[2025/09/16 09:34:19] [error] [upstream] connection #110 to tcp://10.98.51.117:80 timed out after 10 seconds (connection timeout)
[2025/09/16 09:34:19] [error] [upstream] connection #117 to tcp://10.98.51.117:80 timed out after 10 seconds (connection timeout)
[2025/09/16 09:34:19] [error] [upstream] connection #103 to tcp://10.98.51.117:80 timed out after 10 seconds (connection timeout)
[2025/09/16 09:34:19] [error] [upstream] connection #108 to tcp://10.98.51.117:80 timed out after 10 seconds (connection timeout)
[2025/09/16 09:34:19] [error] [upstream] connection #65 to tcp://10.98.51.117:80 timed out after 10 seconds (connection timeout)
[2025/09/16 09:34:19] [error] [upstream] connection #99 to tcp://10.98.51.117:80 timed out after 10 seconds (connection timeout)
[2025/09/16 09:34:19] [error] [upstream] connection #100 to tcp://10.98.51.117:80 timed out after 10 seconds (connection timeout)
[2025/09/16 09:34:19] [error] [upstream] connection #101 to tcp://10.98.51.117:80 timed out after 10 seconds (connection timeout)
[2025/09/16 09:34:19] [error] [output:loki:loki.0] no upstream connections available
[2025/09/16 09:34:19] [error] [output:loki:loki.0] no upstream connections available
[2025/09/16 09:34:19] [error] [output:loki:loki.0] no upstream connections available
[2025/09/16 09:34:19] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:19] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:19] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:19] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:19] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:19] [ warn] [engine] failed to flush chunk '14-1758015249.58509333.flb', retry in 6 seconds: task_id=12, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=loki.0 (out_id=0)
[2025/09/16 09:34:19] [ warn] [engine] failed to flush chunk '14-1758015248.984731208.flb', retry in 11 seconds: task_id=6, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:19] [ warn] [engine] failed to flush chunk '14-1758015249.58543375.flb', retry in 10 seconds: task_id=13, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=loki.0 (out_id=0)
[2025/09/16 09:34:19] [ warn] [engine] failed to flush chunk '14-1758015248.993736958.flb', retry in 10 seconds: task_id=7, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:19] [ warn] [engine] failed to flush chunk '14-1758015249.58581708.flb', retry in 10 seconds: task_id=14, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=loki.0 (out_id=0)
[2025/09/16 09:34:19] [ warn] [engine] failed to flush chunk '14-1758015248.999870250.flb', retry in 10 seconds: task_id=8, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:19] [ warn] [engine] failed to flush chunk '14-1758015249.10267000.flb', retry in 10 seconds: task_id=9, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:19] [ warn] [engine] failed to flush chunk '14-1758015249.37808750.flb', retry in 6 seconds: task_id=10, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:20] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:20] [error] [engine] chunk '14-1758015248.935199542.flb' cannot be retried: task_id=2, input=tail.1 > output=loki.2
[2025/09/16 09:34:21] [error] [upstream] connection #113 to tcp://10.98.51.117:80 timed out after 10 seconds (connection timeout)
[2025/09/16 09:34:21] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:21] [ warn] [engine] failed to flush chunk '14-1758015250.769938626.flb', retry in 10 seconds: task_id=17, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:21] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:21] [ warn] [engine] failed to flush chunk '14-1758015260.777972089.flb', retry in 10 seconds: task_id=26, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:21] [error] [output:opensearch:opensearch.1] HTTP status=503 URI=/_bulk, response:
OpenSearch Security not initialized.

[2025/09/16 09:34:21] [error] [engine] chunk '14-1758015249.58543375.flb' cannot be retried: task_id=13, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=opensearch.1
[2025/09/16 09:34:21] [error] [output:opensearch:opensearch.1] HTTP status=503 URI=/_bulk, response:
OpenSearch Security not initialized.

[2025/09/16 09:34:21] [ warn] [engine] failed to flush chunk '14-1758015261.106259339.flb', retry in 6 seconds: task_id=28, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=opensearch.1 (out_id=1)
[2025/09/16 09:34:22] [error] [output:opensearch:opensearch.1] HTTP status=503 URI=/_bulk, response:
OpenSearch Security not initialized.

[2025/09/16 09:34:22] [ warn] [engine] failed to flush chunk '14-1758015261.905398256.flb', retry in 7 seconds: task_id=30, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=opensearch.1 (out_id=1)
[2025/09/16 09:34:22] [error] [net] TCP connection failed: loki-gateway.default.svc.cluster.local:80 (Connection refused)
[2025/09/16 09:34:22] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:22] [ warn] [engine] failed to flush chunk '14-1758015260.815244922.flb', retry in 9 seconds: task_id=27, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:22] [error] [upstream] connection #111 to tcp://10.98.51.117:80 timed out after 10 seconds (connection timeout)
[2025/09/16 09:34:22] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:22] [ warn] [engine] failed to flush chunk '14-1758015251.463633001.flb', retry in 10 seconds: task_id=18, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:23] [error] [net] TCP connection failed: loki-gateway.default.svc.cluster.local:80 (Connection refused)
[2025/09/16 09:34:23] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:23] [error] [engine] chunk '14-1758015249.44655208.flb' cannot be retried: task_id=11, input=tail.1 > output=loki.2
[2025/09/16 09:34:24] [error] [upstream] connection #119 to tcp://10.98.51.117:80 timed out after 10 seconds (connection timeout)
[2025/09/16 09:34:24] [error] [upstream] connection #120 to tcp://10.98.51.117:80 timed out after 10 seconds (connection timeout)
[2025/09/16 09:34:24] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:24] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:24] [ warn] [engine] failed to flush chunk '14-1758015253.445723377.flb', retry in 8 seconds: task_id=21, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:24] [ warn] [engine] failed to flush chunk '14-1758015253.815948336.flb', retry in 7 seconds: task_id=22, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:24] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:24] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:24] [ warn] [engine] failed to flush chunk '14-1758015263.494747632.flb', retry in 8 seconds: task_id=11, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:24] [error] [engine] chunk '14-1758015254.958346295.flb' cannot be retried: task_id=24, input=tail.1 > output=loki.2
[2025/09/16 09:34:24] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:24] [ warn] [engine] failed to flush chunk '14-1758015263.754455632.flb', retry in 11 seconds: task_id=32, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:24] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:24] [ warn] [engine] failed to flush chunk '14-1758015262.432774923.flb', retry in 10 seconds: task_id=31, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:24] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:24] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:24] [ warn] [engine] failed to flush chunk '14-1758015259.442181797.flb', retry in 7 seconds: task_id=16, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:24] [error] [engine] chunk '14-1758015252.485470460.flb' cannot be retried: task_id=20, input=tail.1 > output=loki.2
[2025/09/16 09:34:25] [error] [output:loki:loki.0] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:25] [error] [engine] chunk '14-1758015249.58509333.flb' cannot be retried: task_id=12, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=loki.0
[2025/09/16 09:34:25] [error] [upstream] connection #105 to tcp://10.98.51.117:80 timed out after 10 seconds (connection timeout)
[2025/09/16 09:34:25] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:25] [ warn] [engine] failed to flush chunk '14-1758015254.470507961.flb', retry in 11 seconds: task_id=23, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:26] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:26] [ warn] [engine] failed to flush chunk '14-1758015265.434958841.flb', retry in 8 seconds: task_id=12, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:27] [error] [upstream] connection #123 to tcp://10.98.51.117:80 timed out after 10 seconds (connection timeout)
[2025/09/16 09:34:27] [error] [output:loki:loki.2] no upstream connections available
[2025/09/16 09:34:27] [ warn] [engine] failed to flush chunk '14-1758015255.440155170.flb', retry in 8 seconds: task_id=25, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:27] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:27] [ warn] [engine] failed to flush chunk '14-1758015266.437255133.flb', retry in 10 seconds: task_id=24, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:27] [ info] [engine] flush chunk '14-1758015261.106259339.flb' succeeded at retry 1: task_id=28, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=opensearch.1 (out_id=1)
[2025/09/16 09:34:28] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:28] [ warn] [engine] failed to flush chunk '14-1758015264.430722007.flb', retry in 7 seconds: task_id=20, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:29] [error] [output:loki:loki.0] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:29] [error] [engine] chunk '14-1758015249.58543375.flb' cannot be retried: task_id=13, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=loki.0
[2025/09/16 09:34:29] [ info] [engine] flush chunk '14-1758015261.905398256.flb' succeeded at retry 1: task_id=30, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=opensearch.1 (out_id=1)
[2025/09/16 09:34:30] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:30] [ warn] [engine] failed to flush chunk '14-1758015267.430851925.flb', retry in 11 seconds: task_id=33, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:31] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:31] [ warn] [engine] failed to flush chunk '14-1758015270.779454094.flb', retry in 11 seconds: task_id=37, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:32] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:32] [error] [engine] chunk '14-1758015250.769938626.flb' cannot be retried: task_id=17, input=tail.1 > output=loki.2
[2025/09/16 09:34:33] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:33] [ warn] [engine] failed to flush chunk '14-1758015271.433800219.flb', retry in 7 seconds: task_id=39, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:34] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:34] [ warn] [engine] failed to flush chunk '14-1758015272.453625928.flb', retry in 10 seconds: task_id=17, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:35] [error] [output:loki:loki.0] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:35] [ warn] [engine] failed to flush chunk '14-1758015273.905525554.flb', retry in 10 seconds: task_id=41, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=loki.0 (out_id=0)
[2025/09/16 09:34:36] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:36] [error] [engine] chunk '14-1758015262.432774923.flb' cannot be retried: task_id=31, input=tail.1 > output=loki.2
[2025/09/16 09:34:37] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:37] [ warn] [engine] failed to flush chunk '14-1758015275.743219179.flb', retry in 9 seconds: task_id=44, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:38] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:38] [error] [engine] chunk '14-1758015254.470507961.flb' cannot be retried: task_id=23, input=tail.1 > output=loki.2
[2025/09/16 09:34:39] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:39] [error] [engine] chunk '14-1758015266.437255133.flb' cannot be retried: task_id=24, input=tail.1 > output=loki.2
[2025/09/16 09:34:40] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:40] [ warn] [engine] failed to flush chunk '14-1758015278.469378958.flb', retry in 11 seconds: task_id=23, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:41] [error] [output:loki:loki.0] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:41] [ warn] [engine] failed to flush chunk '14-1758015279.811585792.flb', retry in 11 seconds: task_id=47, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=loki.0 (out_id=0)
[2025/09/16 09:34:42] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:42] [ warn] [engine] failed to flush chunk '14-1758015280.453303751.flb', retry in 7 seconds: task_id=48, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:43] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:43] [error] [engine] chunk '14-1758015267.430851925.flb' cannot be retried: task_id=33, input=tail.1 > output=loki.2
[2025/09/16 09:34:44] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:44] [ warn] [engine] failed to flush chunk '14-1758015281.477234501.flb', retry in 10 seconds: task_id=49, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:45] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:45] [ warn] [engine] failed to flush chunk '14-1758015283.775295711.flb', retry in 6 seconds: task_id=56, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:46] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:46] [error] [engine] chunk '14-1758015272.453625928.flb' cannot be retried: task_id=17, input=tail.1 > output=loki.2
[2025/09/16 09:34:47] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:47] [ warn] [engine] failed to flush chunk '14-1758015285.744537253.flb', retry in 8 seconds: task_id=60, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:48] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:48] [ warn] [engine] failed to flush chunk '14-1758015287.493365171.flb', retry in 7 seconds: task_id=63, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:49] [error] [output:loki:loki.2] could not flush records to loki-gateway.default.svc.cluster.local:80 HTTP status=502
[2025/09/16 09:34:49] [ warn] [engine] failed to flush chunk '14-1758015286.469302879.flb', retry in 7 seconds: task_id=17, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:50] [ info] [engine] flush chunk '14-1758015280.453303751.flb' succeeded at retry 1: task_id=48, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:50] [ info] [engine] flush chunk '14-1758015273.905525554.flb' succeeded at retry 1: task_id=41, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=loki.0 (out_id=0)
[2025/09/16 09:34:50] [ info] [engine] flush chunk '14-1758015275.743219179.flb' succeeded at retry 1: task_id=44, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:50] [ info] [engine] flush chunk '14-1758015260.777972089.flb' succeeded at retry 1: task_id=26, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:50] [ info] [engine] flush chunk '14-1758015253.815948336.flb' succeeded at retry 1: task_id=22, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:50] [ info] [engine] flush chunk '14-1758015260.815244922.flb' succeeded at retry 1: task_id=27, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:50] [ info] [engine] flush chunk '14-1758015259.442181797.flb' succeeded at retry 1: task_id=16, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:51] [ info] [engine] flush chunk '14-1758015283.775295711.flb' succeeded at retry 1: task_id=56, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:51] [ info] [engine] flush chunk '14-1758015278.469378958.flb' succeeded at retry 1: task_id=23, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:51] [ info] [engine] flush chunk '14-1758015271.433800219.flb' succeeded at retry 1: task_id=39, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:51] [ info] [engine] flush chunk '14-1758015253.445723377.flb' succeeded at retry 1: task_id=21, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:51] [ info] [engine] flush chunk '14-1758015251.463633001.flb' succeeded at retry 1: task_id=18, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:51] [ info] [engine] flush chunk '14-1758015263.494747632.flb' succeeded at retry 1: task_id=11, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:52] [ info] [engine] flush chunk '14-1758015279.811585792.flb' succeeded at retry 1: task_id=47, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=loki.0 (out_id=0)
[2025/09/16 09:34:53] [ info] [engine] flush chunk '14-1758015270.779454094.flb' succeeded at retry 1: task_id=37, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:53] [ info] [engine] flush chunk '14-1758015265.434958841.flb' succeeded at retry 1: task_id=12, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:54] [ info] [engine] flush chunk '14-1758015281.477234501.flb' succeeded at retry 1: task_id=49, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:54] [ info] [engine] flush chunk '14-1758015255.440155170.flb' succeeded at retry 1: task_id=25, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:54] [ info] [engine] flush chunk '14-1758015263.754455632.flb' succeeded at retry 1: task_id=32, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:54] [ info] [engine] flush chunk '14-1758015264.430722007.flb' succeeded at retry 1: task_id=20, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:55] [ info] [engine] flush chunk '14-1758015285.744537253.flb' succeeded at retry 1: task_id=60, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:55] [ info] [engine] flush chunk '14-1758015287.493365171.flb' succeeded at retry 1: task_id=63, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:34:56] [ info] [engine] flush chunk '14-1758015286.469302879.flb' succeeded at retry 1: task_id=17, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:35:00] [ info] [engine] flush chunk '14-1758015252.415700960.flb' succeeded at retry 1: task_id=19, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:35:00] [ info] [engine] flush chunk '14-1758015249.441921459.flb' succeeded at retry 1: task_id=15, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:35:00] [ info] [engine] flush chunk '14-1758015248.924692333.flb' succeeded at retry 1: task_id=1, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:35:00] [ info] [engine] flush chunk '14-1758015248.944552250.flb' succeeded at retry 1: task_id=3, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:35:01] [ info] [engine] flush chunk '14-1758015249.37808750.flb' succeeded at retry 1: task_id=10, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:35:05] [ info] [engine] flush chunk '14-1758015249.10267000.flb' succeeded at retry 1: task_id=9, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:35:05] [ info] [engine] flush chunk '14-1758015248.999870250.flb' succeeded at retry 1: task_id=8, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:35:05] [ info] [engine] flush chunk '14-1758015248.993736958.flb' succeeded at retry 1: task_id=7, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:35:05] [ info] [engine] flush chunk '14-1758015249.58581708.flb' succeeded at retry 1: task_id=14, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=loki.0 (out_id=0)
[2025/09/16 09:35:06] [ info] [engine] flush chunk '14-1758015248.984731208.flb' succeeded at retry 1: task_id=6, input=tail.1 > output=loki.2 (out_id=2)
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=552519 watch_fd=26 name=/var/log/containers/contrast-cargo-cats-dataservice-76bb878cbb-4qs9q_demo-5_contrast-init-bb19ebcd207195f1822c14196554acb9b7550512f4426ebb9471080fece26ad6.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=552665 watch_fd=27 name=/var/log/containers/contrast-cargo-cats-dataservice-76bb878cbb-4qs9q_demo-5_dataservice-355e495e7563c9e32c03ea601ebfbb1972b1fbe1e3f47f97c3a47f87adf51616.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=540021 watch_fd=28 name=/var/log/containers/contrast-cargo-cats-falco-vgz2x_demo-5_falco-driver-loader-77d72306f932668c85db73ef401c605baa6b8dc15c8fb5333ede8c55ca09148b.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=555135 watch_fd=29 name=/var/log/containers/contrast-cargo-cats-falco-vgz2x_demo-5_falcoctl-artifact-follow-66ede8a4f3e45df3b0f39c8f21c1e6834325d69cb2a8a6a0c9a359f67f6c895f.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=540182 watch_fd=30 name=/var/log/containers/contrast-cargo-cats-falco-vgz2x_demo-5_falcoctl-artifact-install-377184d97a2037bd7de4bad8158773fb54e1182be0971da2f74f7cfd34b5c84a.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=552443 watch_fd=31 name=/var/log/containers/contrast-cargo-cats-frontgateservice-64fc9c8dff-jtj4g_demo-5_contrast-init-c362d0975c9fdd544ad7f374305caad93a81d1b2967c79f1568a48565758cf0e.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=552626 watch_fd=32 name=/var/log/containers/contrast-cargo-cats-frontgateservice-64fc9c8dff-jtj4g_demo-5_frontgateservice-c1d8d0d98dba3b5ade2b71ad197df7c8863505714cd48fec2c6ecf813a1ec4ed.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=552456 watch_fd=33 name=/var/log/containers/contrast-cargo-cats-imageservice-57f65dcbbf-fzptx_demo-5_contrast-init-4feecce91a0251756d49dd28476b54baa78aab543b9b67cdaedce7f7964be466.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=552547 watch_fd=34 name=/var/log/containers/contrast-cargo-cats-imageservice-57f65dcbbf-fzptx_demo-5_imageservice-f45380e15e0e979b4dbf9ffeabe67cf522a915c9dd0cc187eff4c3801c7d2923.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=530269 watch_fd=35 name=/var/log/containers/contrast-cargo-cats-ingress-nginx-controller-7856998c5-62rvk_demo-5_controller-113d855c096dc194461862632e48607531618b5b7ce9753506ab9f0a9b5f8e7b.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=553872 watch_fd=36 name=/var/log/containers/contrast-cargo-cats-labelservice-77fd5f765b-546r5_demo-5_labelservice-7ebc09e0145b3a81f5320e9b77c709b7b7817b6e8a89c0489403af9774ad986e.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=552586 watch_fd=37 name=/var/log/containers/fluent-operator-6cf7c75cdb-h95dj_fluent_fluent-operator-a059f2f8d874ad709f913394d2c4276ada445aca911f640d64aeb53e51aaa637.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=539949 watch_fd=38 name=/var/log/containers/fluent-operator-6cf7c75cdb-h95dj_fluent_setenv-4c868db4e138a643e0f9c86fb4e3f8a9919aaff822c0626725ff119d4b1c95a7.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=532166 watch_fd=39 name=/var/log/containers/loki-0_default_loki-sc-rules-36665284da871da783eb8f43d352225ca8249a83a81ec4cce6cb2888c19de590.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=535731 watch_fd=40 name=/var/log/containers/loki-chunks-cache-0_default_exporter-5f51575527c02652a658b406ff042e9976827bd83cd17a98513974c4519636a6.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=538269 watch_fd=41 name=/var/log/containers/loki-results-cache-0_default_exporter-1896267feeb12335c22b8425c7141d0a5776d26bff0c6b00ff20b9edf707ffc3.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=552396 watch_fd=42 name=/var/log/containers/opensearch-dashboard-74dcfd65f9-5pcwd_demo-5_dashboard-3bb76891b058115259a37099ce013616fa43c57d5822deb7de33c22451252a0e.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=539283 watch_fd=43 name=/var/log/containers/prometheus-server-5d877c6bb8-9xt4x_default_prometheus-server-8788a32389c103df40b95fe57a19fd5c08badbd1d89f8f7b277b1c32b7a0237b.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=554891 watch_fd=44 name=/var/log/containers/simulation-console-exploit-server-7b64fd69fc-ftr2v_demo-5_exploit-server-244a07b5536ef7477c74e111a1276040af37d35646fd3091cdfca627e0030f0c.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=552963 watch_fd=45 name=/var/log/containers/contrast-cargo-cats-webhookservice-6c6fd86f74-jgr24_demo-5_webhookservice-2365a6cbb9ba66a06a9988b1f7ecb43591b825e4048349e003a1ae2baeeeb724.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=552924 watch_fd=46 name=/var/log/containers/loki-gateway-c5fb897b8-s7zwk_default_nginx-83c395cb177232cfb2e4b2963adc6362a77968e47924b1fcf9bc0d96e07fc25f.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=540139 watch_fd=47 name=/var/log/containers/simulation-console-zapproxy-fd76f77f5-hmgj4_demo-5_zapproxy-2c7685793818440fc9f5320e609174e4bfc76fd892db70c0712fd6802860b74a.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=553667 watch_fd=48 name=/var/log/containers/contrast-cargo-cats-docservice-74c9bd587d-psnth_demo-5_docservice-eeb5380f87f477d39097adff826943e9e480d718b06bf625f2681ffd9da74775.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=554067 watch_fd=49 name=/var/log/containers/contrast-cargo-cats-falco-vgz2x_demo-5_falco-c4f49a43330bc935cb19e79e83380546f131cb4ad435bdca3ba91caafe429f96.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=541791 watch_fd=50 name=/var/log/containers/opensearch-node-7799564646-qw5vn_demo-5_opensearch-node-4d5ae0d5225758c30744cfba7fd24e0b26fae4dac4fadc3947079bf67e84347b.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=552823 watch_fd=51 name=/var/log/containers/contrast-cargo-cats-docservice-74c9bd587d-psnth_demo-5_contrast-init-4e567cf364a3093f7697ba2aad413d9b8660c63954f4443a1ecfb9935a09f085.log
[2025/09/16 09:35:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=552704 watch_fd=52 name=/var/log/containers/contrast-cargo-cats-webhookservice-6c6fd86f74-jgr24_demo-5_contrast-init-1bc774a82487907418f2642e24cef1e60a7ee02543231fd850d5f4416aeeaac8.log
[2025/09/16 09:35:09] [ warn] [input] re_emitted_3f13fd6485d6450a50e28c5a777902a8 paused (mem buf overlimit)
[2025/09/16 09:35:09] [ info] [input] pausing re_emitted_3f13fd6485d6450a50e28c5a777902a8
[2025/09/16 09:35:09] [ info] [input] pausing tail.1
[2025/09/16 09:35:09] [error] [output:loki:loki.0] loki-gateway.default.svc.cluster.local:80, HTTP status=429
Ingestion rate limit exceeded for user fake (limit: 4194304 bytes/sec) while attempting to ingest '2152' lines totaling '2467510' bytes, reduce log volume or contact your Loki administrator to see if the limit can be increased

[2025/09/16 09:35:09] [ warn] [engine] failed to flush chunk '14-1758015308.652301417.flb', retry in 11 seconds: task_id=21, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=loki.0 (out_id=0)
[2025/09/16 09:35:09] [error] [output:loki:loki.0] loki-gateway.default.svc.cluster.local:80, HTTP status=429
Ingestion rate limit exceeded for user fake (limit: 4194304 bytes/sec) while attempting to ingest '2538' lines totaling '3055267' bytes, reduce log volume or contact your Loki administrator to see if the limit can be increased

[2025/09/16 09:35:09] [ warn] [engine] failed to flush chunk '14-1758015308.966209250.flb', retry in 11 seconds: task_id=30, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=loki.0 (out_id=0)
[2025/09/16 09:35:10] [ info] [input:tail:tail.1] inode=226 link_rotated: /var/log/containers/simulation-console-exploit-server-7b64fd69fc-ftr2v_demo-5_exploit-server-244a07b5536ef7477c74e111a1276040af37d35646fd3091cdfca627e0030f0c.log
[2025/09/16 09:35:10] [ info] [input:tail:tail.1] inode=554891 handle rotation(): /var/log/containers/simulation-console-exploit-server-7b64fd69fc-ftr2v_demo-5_exploit-server-244a07b5536ef7477c74e111a1276040af37d35646fd3091cdfca627e0030f0c.log => /var/lib/docker/containers/244a07b5536ef7477c74e111a1276040af37d35646fd3091cdfca627e0030f0c/244a07b5536ef7477c74e111a1276040af37d35646fd3091cdfca627e0030f0c-json.log (deleted)
[2025/09/16 09:35:10] [ info] [input] resume re_emitted_3f13fd6485d6450a50e28c5a777902a8
[2025/09/16 09:35:10] [ info] [input] resume tail.1
[2025/09/16 09:35:10] [ info] [input] re_emitted_3f13fd6485d6450a50e28c5a777902a8 resume (mem buf overlimit)
[2025/09/16 09:35:10] [ warn] [input] re_emitted_3f13fd6485d6450a50e28c5a777902a8 paused (mem buf overlimit)
[2025/09/16 09:35:10] [ info] [input] pausing re_emitted_3f13fd6485d6450a50e28c5a777902a8
[2025/09/16 09:35:10] [ info] [input] pausing tail.1
[2025/09/16 09:35:11] [ info] [input] resume re_emitted_3f13fd6485d6450a50e28c5a777902a8
[2025/09/16 09:35:11] [ info] [input] resume tail.1
[2025/09/16 09:35:11] [ info] [input] re_emitted_3f13fd6485d6450a50e28c5a777902a8 resume (mem buf overlimit)
[2025/09/16 09:35:11] [ warn] [input] re_emitted_3f13fd6485d6450a50e28c5a777902a8 paused (mem buf overlimit)
[2025/09/16 09:35:11] [ info] [input] pausing re_emitted_3f13fd6485d6450a50e28c5a777902a8
[2025/09/16 09:35:11] [ info] [input] pausing tail.1
[2025/09/16 09:35:11] [ info] [input] resume re_emitted_3f13fd6485d6450a50e28c5a777902a8
[2025/09/16 09:35:11] [ info] [input] resume tail.1
[2025/09/16 09:35:11] [ info] [input] re_emitted_3f13fd6485d6450a50e28c5a777902a8 resume (mem buf overlimit)
[2025/09/16 09:35:11] [ info] [input:tail:tail.1] inotify_fs_add(): inode=552780 watch_fd=53 name=/var/log/containers/contrast-cargo-cats-labelservice-77fd5f765b-546r5_demo-5_contrast-init-250c3ea3a88581d5bcb403da14a132f24ed627f15b1c2e2d7bc8d72391d88e70.log
[2025/09/16 09:35:11] [ info] [input:tail:tail.1] inotify_fs_remove(): inode=554891 watch_fd=44
[2025/09/16 09:35:20] [ info] [engine] flush chunk '14-1758015308.652301417.flb' succeeded at retry 1: task_id=21, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=loki.0 (out_id=0)
[2025/09/16 09:35:20] [ info] [engine] flush chunk '14-1758015308.966209250.flb' succeeded at retry 1: task_id=30, input=re_emitted_3f13fd6485d6450a50e28c5a777902a8 > output=loki.0 (out_id=0)
[2025/09/16 09:36:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=555668 watch_fd=54 name=/var/log/containers/simulation-console-exploit-server-7b64fd69fc-ftr2v_demo-5_exploit-server-ca5a07a20abe7ee6317e17ad70ea03cab799ef5bc79547461d7a276ffb481616.log
[2025/09/16 09:36:39] [ info] [input:tail:tail.1] inotify_fs_remove(): inode=555668 watch_fd=54
[2025/09/16 09:37:08] [ info] [input:tail:tail.1] inotify_fs_add(): inode=555851 watch_fd=55 name=/var/log/containers/simulation-console-exploit-server-7b64fd69fc-ftr2v_demo-5_exploit-server-7db9f937046595b846382efbeb1d700037af72c22b1669b364cfcb2dc0a3a313.log
[2025/09/16 09:39:25] [ info] [input:tail:tail.1] inotify_fs_remove(): inode=555851 watch_fd=55
```
