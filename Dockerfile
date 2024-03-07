FROM glyomics/apiframework:latest

RUN mkdir -p /GlycoSight/bin /GlycoSight/lib /GlycoSight/fasta /data
ADD bin /GlycoSight/bin
ADD VERSION CPTACREPVER CANONSEQVER /GlycoSight
ADD lib/msgfplus /GlycoSight/lib/msgfplus
ADD lib/jdk1.8.0_391 /GlycoSight/lib/jdk1.8.0_391

ARG CPTACREPVER
RUN cd /GlycoSight/lib; wget -q -O - "http://cptac-cdap.georgetown.edu.s3-website-us-east-1.amazonaws.com/CPTAC-CDAP-Reports-${CPTACREPVER}.linux-x86_64.tgz" | tar xzf - 

ARG CANONSEQVER
RUN cd /GlycoSight/fasta; wget -q --no-check-certificate "https://data.glygen.org/ln2data/releases/data/${CANONSEQVER}/reviewed/human_protein_canonicalsequences.fasta"; /GlycoSight/lib/CPTAC-CDAP-Reports/compress_seq-Linux-x86_64.exe -i human_protein_canonicalsequences.fasta -E 36

ARG TOOLVER

USER 1000
WORKDIR /data
CMD /GlycoSight/bin/nlinkedsites.sh
