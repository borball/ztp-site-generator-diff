# ztp-site-generator-diff

Script to compare two versions of ztp-site-generator.

```shell
# ./diff.sh v4.14.0-71 v4.14.2-6
diff -r --color /root/ztp-site-generator-diff/v4.14.0-71/argocd/deployment/argocd-openshift-gitops-patch.json /root/ztp-site-generator-diff/v4.14.2-6/argocd/deployment/argocd-openshift-gitops-patch.json
43c43
<           "image": "registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.0"
---
>           "image": "registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.2"
diff -r --color /root/ztp-site-generator-diff/v4.14.0-71/argocd/README.md /root/ztp-site-generator-diff/v4.14.2-6/argocd/README.md
11c11
<     $ podman pull registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.0
---
>     $ podman pull registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.2
diff -r --color /root/ztp-site-generator-diff/v4.14.0-71/source-crs/ReduceMonitoringFootprint.yaml /root/ztp-site-generator-diff/v4.14.2-6/source-crs/ReduceMonitoringFootprint.yaml
10,11d9
<     grafana:
<       enabled: false
```
