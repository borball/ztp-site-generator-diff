#!/bin/bash

BASEDIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

usage(){
  echo "Usage: $0 -f v1 -t v2 -a|-r|-e -h"
  echo "This will generate a diff file between registry.redhat.io/openshift4/ztp-site-generate-rhel8:\$v1 and registry.redhat.io/openshift4/ztp-site-generate-rhel8:\$v2"
  echo "  -a compare all content in the images (this is the default)"
  echo "  -r compare source-crs in the images"
  echo "  -e compare example files in the images"

  echo "Example: $0 -f v4.14.1-5 -t v4.14.2-6"
  echo "Example: $0 -f v4.14.1-5 -t v4.14.2-6 -r"
  echo "Example: $0 -f v4.14.1-5 -t v4.14.2-6 -a"

  echo
  echo "make sure you have pull secret to pull images from redhat registries."
}

while getopts "f:t:aerh" arg; do
  case $arg in
    f)
      echo "Compare version 1: ${OPTARG}"
      v1=${OPTARG}
      ;;
    t)
      echo "Compare version 2: ${OPTARG}"
      v2=${OPTARG}
      ;;
    a)
      echo "Compare all content in the image."
      mode="a"
      ;;
    r)
      echo "Compare the source-crs in the image."
      mode="r"
      ;;
    e)
      echo "Compare the examples in the image."
      mode="e"
      ;;
    h | *) # Display help.
      usage
      exit 0
      ;;
  esac
done

if [ -z "$v1" ] || [ -z "$v2" ]; then
  usage
  exit
fi

repo=registry.redhat.io/openshift4/ztp-site-generate-rhel8
image1=$repo:$v1
image2=$repo:$v2

mkdir -p $BASEDIR/$v1
mkdir -p $BASEDIR/$v2

podman run --log-driver=none --rm $image1 extract /home/ztp --tar | tar x -C $BASEDIR/$v1
podman run --log-driver=none --rm $image2 extract /home/ztp --tar | tar x -C $BASEDIR/$v2

if [ "$mode" == 'r' ]; then
  diff -r --color $BASEDIR/$v1/source-crs  $BASEDIR/$v2/source-crs
fi

if [ "$mode" == 'e' ]; then
  diff -r --color $BASEDIR/$v1/argocd  $BASEDIR/$v2/argocd
fi

if [ "$mode" == 'a' ] || [ -z $mode ] ; then
  diff -r --color $BASEDIR/$v1  $BASEDIR/$v2
fi





