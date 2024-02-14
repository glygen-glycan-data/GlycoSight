# GlycoSight

## Docker container usage

Use script [run.sh](run.sh) to execute using the docker container.

```
  %<prompt>% ./run.sh data/PDC000251/*.mzid.gz > output.tsv
  Parsing file PDC000251/01CPTAC_OVprospective_G_JHUZ_20160317_QE_r01.mzid.gz... done.
  Parsing file PDC000251/01CPTAC_OVprospective_G_JHUZ_20160317_QE_r02.mzid.gz... done.
  ...
  Parsing file PDC000251/13CPTAC_OVprospective_G_JHUZ_20160317_QE_r02.mzid.gz... done.
  Parsing file PDC000251/13CPTAC_OVprospective_G_JHUZ_20160317_QE_r02.mzid.gz... done.
  Mapping peptides to canonical UniProt sequences... done.
  %<prompt>% head output.tsv
  UniProtAcc      AAPosition      SpectralCount   DistinctPeptideCount    Peptides
  A6NGU5-1        344     10      1       nMTSEFFAAQLR
  A6NMZ7-1        198     38      1       DLSMFSQnMTHIIK
  A6NMZ7-1        275     12      1       VGLVAYSnETK
  A6NMZ7-1        347     34      1       DSEDnVTK
  A6NMZ7-1        400     40      1       TFADLAAHnQTFLK
  A6NMZ7-1        988     8       1       GIFSDVTASVCnSSK
  A6NMZ7-1        2034    12      1       AEFnLTTYR
  A8K2U0-1        1020    2       1       HSnGSYSAFGER
  A8MVW0-1        66      2       1       ASVDVFGnR
  %<prompt>%
```

## Direct usage

Use script `nlinkedsites.sh` to execute using the docker container.
```
  %<prompt>% ../bin/nlinkedsites.sh data/PDC000251/*.mzid.gz > output.tsv
  Parsing file PDC000251/01CPTAC_OVprospective_G_JHUZ_20160317_QE_r01.mzid.gz... done.
  Parsing file PDC000251/01CPTAC_OVprospective_G_JHUZ_20160317_QE_r02.mzid.gz... done.
  ...
  Parsing file PDC000251/13CPTAC_OVprospective_G_JHUZ_20160317_QE_r02.mzid.gz... done.
  Parsing file PDC000251/13CPTAC_OVprospective_G_JHUZ_20160317_QE_r02.mzid.gz... done.
  Mapping peptides to canonical UniProt sequences... done.
  %<prompt>% head output.tsv
  UniProtAcc      AAPosition      SpectralCount   DistinctPeptideCount    Peptides
  A6NGU5-1        344     10      1       nMTSEFFAAQLR
  A6NMZ7-1        198     38      1       DLSMFSQnMTHIIK
  A6NMZ7-1        275     12      1       VGLVAYSnETK
  A6NMZ7-1        347     34      1       DSEDnVTK
  A6NMZ7-1        400     40      1       TFADLAAHnQTFLK
  A6NMZ7-1        988     8       1       GIFSDVTASVCnSSK
  A6NMZ7-1        2034    12      1       AEFnLTTYR
  A8K2U0-1        1020    2       1       HSnGSYSAFGER
  A8MVW0-1        66      2       1       ASVDVFGnR
  %<prompt>%
```
