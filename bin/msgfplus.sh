#!/bin/sh

set -x

PROG=`readlink -f $0`
DIR=`dirname "$PROG"`
JAVA="$DIR/../lib/jdk1.8.0_391/bin/java"
JAR="$DIR/../lib/msgfplus/MSGFPlus-v20170127.jar"
MODS=`mktemp -p . -t ".msgfplus.XXXXXX" --suffix .mods` || exit 1
FASTA="$DIR/../fasta/human_protein_canonicalsequences.fasta"
SPEC="$1"

cat > "$MODS" <<EOF
#Mods
NumMods=2
C2H3N1O1,C,fix,any,Carbamidomethyl
H-1N-1O1,N,opt,any,Deamidated
O1,M,opt,any,Oxidation
EOF

$JAVA -Xmx4G -jar "$JAR" -s "$1" -d "$FASTA" -thread 1 -tasks 1 -tda 1 -mod "$MODS" -t 20.0ppm -ti 0,1 -m 0 -inst 3 -e 1 -protocol 0 -ntt 2 -minLength 6 -maxLength 40 -minCharge 2 -maxCharge 3 -n 1 -verbose 1

rm -f "$MODS"
