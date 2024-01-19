#!/bin/bash

usage(){
	echo "Usage: $0 version1 version2"
	echo "This will generate a diff file between registry.redhat.io/openshift4/ztp-site-generate-rhel8:\$version1 and registry.redhat.io/openshift4/ztp-site-generate-rhel8:\$version2"
  echo "Example: $0 v4.14.1-5 v4.14.2-6"
  echo "This will generate a diff file between registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.1-5 and registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.14.2-6"
  echo
  echo "make sure you have pull secret to pull images from redhat registries."
}

if [ $# -lt 2 ]
then
  usage
  exit
fi

if [[ ( $@ == "--help") ||  $@ == "-h" ]]
then
  usage
  exit
fi

repo=registry.redhat.io/openshift4/ztp-site-generate-rhel8
v1=$1
v2=$2
image1=$repo:$v1
image2=$repo:$v2

echo "Will compare $image1 and $image2:"
echo "------------------"

BASEDIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
mkdir -p $BASEDIR/$v1
mkdir -p $BASEDIR/$v2

podman run --log-driver=none --rm $image1 extract /home/ztp --tar | tar x -C $BASEDIR/$v1
podman run --log-driver=none --rm $image2 extract /home/ztp --tar | tar x -C $BASEDIR/$v2

diff -r --color $BASEDIR/$v1 $BASEDIR/$v2

