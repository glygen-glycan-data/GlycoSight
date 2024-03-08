#!/bin/sh

DIR=`dirname $0`
# MSCONVERT="$DIR/msconvert.sh"
# MSGFPLUS="$DIR/msgfplus.sh"
# NLINKEDSITES="$DIR/nlinkedsites.sh"
MSCONVERT="$DIR/dockerrun.sh msconvert"
MSGFPLUS="$DIR/dockerrun.sh msgfplus"
NLINKEDSITES="$DIR/dockerrun.sh nlinkedsites"

for f in "$@"; do
  BASE=`echo "$f" | sed 's/\.[^.]*$//'`
  MZML=$BASE.mzML
  LOG=$BASE.log
  echo "Processing $f..."
  $MSCONVERT --filter 'peakPicking true 1-' --mzML --zlib --gzip "$f" >$LOG 2>&1
  ( gunzip -c "$BASE"*.mzML.gz > "$MZML") 2>>$LOG
  rm -f "$BASE"*.mzML.gz >>$LOG 2>&1
  $MSGFPLUS /data/"$MZML" >>$LOG 2>&1
  echo "Processing $f done."
done
$NLINKEDSITES *.mzid > nlinkedsites.tsv
