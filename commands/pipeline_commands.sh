########################################
# Targeted NGS Pipeline: KRAS Exon 2
# Author: Siya Singh
########################################


###############
# STEP 1 — Read Simulation (ART)
###############

art_illumina \
-ss HS25 \
-i KRAS_exon2_amplicon.fa \
-p \
-l 150 \
-f 100 \
-m 200 \
-s 10 \
-o KRAS_exon2_simulated


###############
# STEP 2 — Index Reference (BWA)
###############

bwa index KRAS_exon2_reference.fa


###############
# STEP 3 — Align Reads
###############

bwa mem \
KRAS_exon2_reference.fa \
KRAS_exon2_simulated1.fq \
KRAS_exon2_simulated2.fq \
> KRAS_exon2.sam


###############
# STEP 4 — Convert SAM to BAM
###############

samtools view -bS KRAS_exon2.sam > KRAS_exon2.bam


###############
# STEP 5 — Sort BAM
###############

samtools sort KRAS_exon2.bam \
-o KRAS_exon2.sorted.bam


###############
# STEP 6 — Index BAM
###############

samtools index KRAS_exon2.sorted.bam


###############
# STEP 7 — Variant Calling
###############

bcftools mpileup \
-f KRAS_exon2_reference.fa \
KRAS_exon2.sorted.bam | \
bcftools call -mv -Ov \
> KRAS_exon2.vcf

