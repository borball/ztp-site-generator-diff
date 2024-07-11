# ztp-site-generator-diff

Script to compare two versions of ztp-site-generator.

## Usage

```shell
# ./diff.sh
Usage: ./diff.sh -f v1 -t v2 -a|-r|-e -h
This will generate a diff file between registry.redhat.io/openshift4/ztp-site-generate-rhel8:$v1 and registry.redhat.io/openshift4/ztp-site-generate-rhel8:$v2
  -a compare all content in the images (this is the default)
  -r compare source-crs in the images
  -e compare example files in the images
Example: ./diff.sh -f v4.14.1-5 -t v4.14.2-6
Example: ./diff.sh -f v4.14.1-5 -t v4.14.2-6 -r
Example: ./diff.sh -f v4.14.1-5 -t v4.14.2-6 -a

make sure you have pull secret to pull images from redhat registries.
```

or:

```shell
curl -s https://raw.githubusercontent.com/borball/ztp-site-generator-diff/master/diff.sh | bash -s -f v1 -t v2 -a
```

## Example

```shell
# ./diff.sh  -f v4.14.1-5 -t v4.14.2-6
Compare version 1: v4.14.1-5
Compare version 2: v4.14.2-6
diff -r --color /root/v4.14.1-5/argocd/deployment/argocd-openshift-gitops-patch.json /root/v4.14.2-6/argocd/deployment/argocd-openshift-gitops-patch.json
43c43
<           "image": "registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.1"
---
>           "image": "registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.2"
diff -r --color /root/v4.14.1-5/argocd/README.md /root/v4.14.2-6/argocd/README.md
11c11
<     $ podman pull registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.1
---
>     $ podman pull registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.2
```

or:

```shell
# curl -s https://raw.githubusercontent.com/borball/ztp-site-generator-diff/master/diff.sh | bash -s -f v4.14.1-5 -t v4.14.2-6
Compare version 1: v4.14.1-5
Compare version 2: v4.14.2-6
diff -r --color /root/v4.14.1-5/argocd/deployment/argocd-openshift-gitops-patch.json /root/v4.14.2-6/argocd/deployment/argocd-openshift-gitops-patch.json
43c43
<           "image": "registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.1"
---
>           "image": "registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.2"
diff -r --color /root/v4.14.1-5/argocd/README.md /root/v4.14.2-6/argocd/README.md
11c11
<     $ podman pull registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.1
---
>     $ podman pull registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.2
```
