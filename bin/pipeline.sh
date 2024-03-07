#!/bin/sh

DIR=`dirname $0`
MSCONVERT="$DIR/msconvert.sh"
MSGFPLUS="$DIR/msgfplus.sh"

for f in "$@"; do
  BASE=`echo "$f" | sed 's/\.[^.]*$//'`
  MZML=$BASE.mzML
  echo "Processing $f..."
  $MSCONVERT --filter 'peakPicking true 1-' --mzML --zlib --gzip "$f"
  gunzip -c "$BASE"*.mzML.gz > "$MZML"
  rm -f "$BASE"*.mzML.gz
  $MSGFPLUS "$MZML"
  echo "Processing $f done."
done
