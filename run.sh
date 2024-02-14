#!/bin/sh

#
# Execute using docker container
#

IMAGE="glyomics/glycosight:latest"

USER="`id -u`:`id -g`"
CUR=`pwd`
CUR=`readlink -f $CUR`

docker run -u $USER -v $CUR:/data/:Z --rm "$IMAGE" /GlycoSight/bin/nlinkedsites.sh "$@"

