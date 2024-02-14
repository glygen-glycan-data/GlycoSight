# GlycoSight

GlycoSight parses peptide identification results, in mzIdentML format, to find putative N-glycosylation sites. The analyzed sample must have been prepared with PNGase-F, an enzyme which cleaves N-glycans from the Asn amino-acid and deamidates it, and changes the molecular weight of the Asn residue by +0.98. The output table provides the UniProt accession, the amino-acid position of the Asn exibiting deamidation, the number of tandem mass spectra which show deamidation of the residue, the number of distinct peptide sequences which show deamindation of the residue, and the peptide sequences themselves. Peptide sequences are separated by a comma, and the corresponding Asn residue shown in lowercase. 

Notes: 
1. mzIdentML peptide identication results are filtered at 1% spectral FDR.
2. The sample is presumed to be human (peptides are re-aligned to UniProt human protein sequences)

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

Use script `nlinkedsites.sh` to execute directly
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
