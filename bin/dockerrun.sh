#!/bin/sh

#
# Execute using docker container
#

IMAGE="glyomics/glycosight:latest"

USER="`id -u`:`id -g`"
CUR=`pwd`
CUR=`readlink -f $CUR`

if [ "$1" = "" ]; then
  echo "Usage: run.sh ( msconvert | msgfplus | nlinkedsites ) [ arguments ]" 1>&2
  exit 1
fi

case "$1" in 
  msconvert | msgfplus | nlinkedsites) ;;
  *) echo "Usage: run.sh ( msconvert | msgfplus | nlinkedsites ) [ arguments ]" 1>&2; exit 1;;
esac

if [ $1 == "msgfplus" -o $1 == "nlinkedsites" ]; then
  SCRIPT="$1"
  shift
  docker run -u $USER -v $CUR:/data/:Z --rm "$IMAGE" /GlycoSight/bin/$SCRIPT.sh "$@"
else
  shift
  docker run -v $CUR:/data/:Z --rm chambm/pwiz-skyline-i-agree-to-the-vendor-licenses:latest wine msconvert "$@"
fi


