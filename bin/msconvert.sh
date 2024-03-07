#!/bin/sh
DOCKER="docker run -v `pwd`:/data/ --rm"
IMAGE="chambm/pwiz-skyline-i-agree-to-the-vendor-licenses:latest wine msconvert"
$DOCKER $IMAGE "$@"
