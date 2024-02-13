#!/bin/sh

set -x
export CPTACREPVER=`cat CPTACREPVER`
mkdir -p lib
( cd lib; rm -rf CPTAC-CDAP-Reports; wget -q -O - "http://cptac-cdap.georgetown.edu.s3-website-us-east-1.amazonaws.com/CPTAC-CDAP-Reports-${CPTACREPVER}.linux-x86_64.tgz" | tar xzf - )

export CANONSEQVER=`cat CANONSEQVER`
mkdir -p fasta
( cd fasta; rm *.fasta *.fasta.*; wget --no-check-certificate -q "https://data.glygen.org/ln2data/releases/data/${CANONSEQVER}/reviewed/human_protein_canonicalsequences.fasta"; ../lib/CPTAC-CDAP-Reports/compress_seq-Linux-x86_64.exe -i human_protein_canonicalsequences.fasta -E 36 )


