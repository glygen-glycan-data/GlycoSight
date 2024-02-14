#!/bin/sh

VERSION=`cat VERSION`
NAME="GlycoSight"
FULLNAME="${NAME}-${VERSION}"

echo "$FULLNAME"

rm -f dist/$FULLNAME*
tar cvzf dist/$FULLNAME.tgz bin data lib fasta VERSION Dockerfile build.sh run.sh *VER

( cd dist; md5sum $FULLNAME.tgz > $FULLNAME.md5 ; touch $FULLNAME.txt )
if [ "$1" ]; then 
  for comment in "$@"; do 
    echo "* $comment" >> dist/$FULLNAME.txt
  done
fi

gh release delete "$FULLNAME" -y 
git push --delete origin "refs/tags/$FULLNAME"
git tag --delete "$FULLNAME"

gh release create "$FULLNAME" dist/$FULLNAME.tgz dist/$FULLNAME.md5 -t "$FULLNAME" -F dist/$FULLNAME.txt
