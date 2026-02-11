# Pipeline Commands

This folder contains the executable command-line workflow used to perform targeted NGS analysis of KRAS exon 2.

## Steps Covered
1. Illumina read simulation (ART)
2. Reference indexing (BWA)
3. Read alignment (BWA-MEM)
4. SAM → BAM conversion (SAMtools)
5. BAM sorting and indexing
6. Variant calling (bcftools)

The pipeline is written for a Linux/WSL environment.

