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
  docker run -u $USER -v $CUR:/data/:Z --rm "$IMAGE" ./bin/"$1".sh "$@"
else
  docker run -v $CUR:/data/:Z --rm chambm/pwiz-skyline-i-agree-to-the-vendor-licenses:latest wine msconvert "$@"
fi


