#!/bin/sh
set -x
DIR=`dirname $0`
MSCONVERT="$DIR/msconvert.sh"
MSGFPLUS="$DIR/msgfplus.sh"
NLINKEDSITES="$DIR/nlinkedsites.sh"

for f in "$@"; do
  BASE=`echo "$f" | sed 's/\.[^.]*$//'`
  MZML=$BASE.mzML
  MZID=$BASE.mzid
  OUT=$BASE.tsv
  $MSCONVERT --filter 'peakPicking vendor mslevel=1-' --mzML --gzip "$f"
  gunzip -c "$BASE*.mzML.gz" > "$MZML"
  rm -f "$BASE*.mzML.gz"
  $MSGFPLUS "$MZML"
  $NLINKEDSITES "$MZID" > "$OUT"
done
