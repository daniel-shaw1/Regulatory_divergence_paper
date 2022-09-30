
We compared gene expression to ACR divergence. 

ACR divergence from X- and Y- specific rates were calculated using /Figure2/Analysis/ACR_sequence_divergence.sh.

RNA-seq alignment was described in /Sequence_alignment_and_QC/RNA_pipeline/

ACRs were assigned to genes using annotatepeaks.sh

Allele specific expression was obtained with htseq transcript count outputs. Alelele specific expression was calculated as log2(# of X transcripts/#of Y transcripts).

Values were plotted and correlation coefficents were calculated in R. Figure4/Rscripts/
