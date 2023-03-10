# Regulatory_divergence_paper
This repository contains the scripts associated with: Positive selection drives cis-regulatory evolution across the threespine stickleback Y chromosome. https://www.biorxiv.org/content/10.1101/2022.11.03.515077v1


We aligned ATAC-seq data following the ATAC_seq_pipeline and RNA-seq data using RNA_seq_pipeline. For RNA-seq we used a custom gtf for XY gametologs created using XY_customgtf. The general pipeline, programs, and command line parameters can be found in /Sequence_alignment_and_QC/ATAC_seq_pipeline and Sequence_alignment_and_QC/RNA_seq_pipeline

ATAC seq peaks called with macs2 were used to calculate sequence divergence between the X chromosome, Y chromosome, and outgroup species (ninespine stickleback fish). The sequence divergence pipeline can be found under /Figure2/Analysis/Identify_ACR_divergence/. The threespine genome assembly and annotations can be found https://stickleback.genetics.uga.edu/downloadData/. The Ninespine stickleback genome can be found https://figshare.com/collections/The_assembly_and_annotation_of_stickleback/4548146.

We compared ACR divergence to intergenic divergence by calculating intergenic permutations. Our steps for identifing intergenic sequence can be found in /Figure2/Analysis/Intergenic_permutations/ and then divergence for these regions was performed using the same script as above.

We identified nuceotide diversity within threespine stickleback fish at regulatory regions, and across intergneic permutations. These scripts can be found in /Figure3/Analyis/



For all analyses comparing ACR with neighboring gene (Expression, dn/ds, haploinsuffiency) we found assigned ACRs to genes using homer. Scripts can be found in /Figure4/Analysis/annotatepeaks.sh/

R scripts for creating each figures are found in /Rscripts_for_figures/ in each corresponding figure directory.

