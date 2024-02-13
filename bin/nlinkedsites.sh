#!/bin/bash

PROG=`readlink -f $0`
DIR=`dirname "$PROG"`
CMDBASE="$DIR/../lib/CPTAC-CDAP-Reports"
PSMDB=`mktemp -p . -t ".data.XXXXXX" --suffix .psm` || exit 1
rm -f "$PSMDB"

for f in "$@"; do
    echo -n "Parsing file $f... " 1>&2
    $PYTHON3 $CMDBASE/loader1 -q -d "$PSMDB" --psmmetric 'Estimated PSM FDR % (PepArML, CPTAC-CAP, MSGF+)' -t 1 --alignments None -i "$f" 2> >( fgrep -v Cached >&2 ) 
    echo "done." 1>&2
done
echo -n "Mapping peptides to canonical UniProt sequences... " 1>&2
$PYTHON3 $CMDBASE/pepremap1 -q -d "$PSMDB" -s $DIR/../fasta/human_protein_canonicalsequences.fasta --pracc UniProtIsoform 2> >( fgrep -v Cached >&2 )
echo "done." 1>&2
$PYTHON3 $CMDBASE/psmdb-shell "$PSMDB" $DIR/extract.psmdbsh
rm -f "$PSMDB"
