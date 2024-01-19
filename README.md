# ztp-site-generator-diff

Script to compare two versions of ztp-site-generator.

## Usage

```shell
% ./diff.sh 
Usage: ./diff.sh v1 v2
This will generate a diff file between registry.redhat.io/openshift4/ztp-site-generate-rhel8:$v1 and registry.redhat.io/openshift4/ztp-site-generate-rhel8:$v2
Example: ./diff.sh v4.14.1-5 v4.14.2-6
This will generate a diff file between registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.1-5 and registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.2-6

make sure you have pull secret to pull images from redhat registries.

```

or:

```shell
curl -s https://raw.githubusercontent.com/borball/ztp-site-generator-diff/master/diff.sh | bash -s $v1 $v2
```

## Example

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

or:

```shell
# curl -s https://raw.githubusercontent.com/borball/ztp-site-generator-diff/master/diff.sh | bash -s v4.14.0-71 v4.14.2-6
Will compare registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.0-71 and registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.2-6:
------------------

diff -r --color /tmp/v4.14.0-71/argocd/deployment/argocd-openshift-gitops-patch.json /tmp/v4.14.2-6/argocd/deployment/argocd-openshift-gitops-patch.json
43c43
<           "image": "registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.0"
---
>           "image": "registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.2"
diff -r --color /tmp/v4.14.0-71/argocd/README.md /tmp/v4.14.2-6/argocd/README.md
11c11
<     $ podman pull registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.0
---
>     $ podman pull registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.2
diff -r --color /tmp/v4.14.0-71/source-crs/ReduceMonitoringFootprint.yaml /tmp/v4.14.2-6/source-crs/ReduceMonitoringFootprint.yaml
10,11d9
<     grafana:
<       enabled: false
```
