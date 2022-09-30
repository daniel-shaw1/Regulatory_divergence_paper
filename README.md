# Regulatory_divergence_paper
This repository contains the scripts associated with: Positive selection drives cis-regulatory evolution across the threespine stickleback Y chromosome.


We aligned ATAC-seq data following the ATAC_seq_pipeline and RNA-seq data using RNA_seq_pipeline. For RNA-seq we used a custom gtf for XY gametologs created using XY_customgtf. Sequence_alignment_and_QC/ATAC_seq_pipeline and Sequence_alignment_and_QC/RNA_seq_pipeline

ATAC seq peaks from macs2 were used to calculate sequence divergence with Identify_ACR_divergence

We compared ACR divergence to intergenic divergence by calculating intergenic permutations

We identified genes near ACRs using homerannotatepeaks.sh


