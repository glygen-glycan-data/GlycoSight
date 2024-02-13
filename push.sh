#!/bin/sh

VERSION=`cat VERSION`
docker push glyomics/glycosight:${VERSION}
docker push glyomics/glycosight:latest

