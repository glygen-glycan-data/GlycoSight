#!/bin/sh

set -x
VERSION=`cat VERSION`
CPTACREPVER=`cat CPTACREPVER`
CANONSEQVER=`cat CANONSEQVER`
docker build --build-arg "CPTACREPVER=${CPTACREPVER}" \
             --build-arg "CANONSEQVER=${CANONSEQVER}" \
             --build-arg "TOOLVER=${VERSION}" \
             -t glyomics/glycosight:${VERSION} \
             -t glyomics/glycosight:latest \
             --no-cache \
             --pull \
             --progress plain \
             .

