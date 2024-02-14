#!/bin/sh

VERSION=`cat VERSION`
NAME="GlycoSight"
FULLNAME="${NAME}-${VERSION}"

echo "$FULLNAME"

rm -rf build
mkdir -p build/$FULLNAME/$NAME
cp -r bin data lib fasta VERSION Dockerfile build.sh run.sh *VER build/$FULLNAME/$NAME
rm -f dist/$FULLNAME*
(cd build/$FULLNAME; tar cvzf ../../dist/$FULLNAME.tgz $NAME )

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
