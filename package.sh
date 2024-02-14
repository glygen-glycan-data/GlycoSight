#!/bin/sh

VERSION=`cat VERSION`
NAME="GlycoSight"
FULLNAME="${NAME}-${VERSION}"

echo "$FULLNAME"
tar cvzf dist/$FULLNAME.tgz bin data lib fasta VERSION Dockerfile build.sh run.sh *VER
