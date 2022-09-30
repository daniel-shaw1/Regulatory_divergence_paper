###This file contains a general pipeline for converting ATAC-seq peak bedfiles into estimages of sequence divergence across species at ATAC-seq peak sites. 
##Briefly, we convert bed files of X-linked peaks to fasta files. Align fasta files to Y and ninespine geneome using blastn. Extract alignments into 3way multiple sequence alignments. And call variants between these alignemtns.




###Convert ACR bed file to fasta using bedtools

bedtools getfasta -fi CombinedX.fa -bed Peaks.bed -fo Peaks.fa

## blast X bed file of ACR peaks (macs2output) to genome. CombinedX.fa contains threespine genome + ninespine genome.




blastn -db CombinedX.fa -query Peaks.fa -out Peaks.out -perc_identity 75 -task blastn -outfmt '6 sseqid qseqid qseq evalue length sstrand'
#convert blastoutput to fasta output msa

awk 'BEGIN { OFS = "\n"} {print ">" $1 $2, $3}' Peaks.out  > msa1.fasta

## make each alignment into single fasta line to be used for grep. Filter for sequences that have only alignments on X, Y and AUtosome 19 in Ninespine.

awk '!/^>/ { printf "%s", $0; n = "\n" } /^>/ { print n $0; n = "" } END { printf "%s", n }' msa1.fasta > sample1_singleline.fa

grep chrXIX sample1_singleline > Xchr.fa





##In a new directory,  reextract fasta file for ordered regions and number each fasta file. Ensure each fasta file is the same number of sequences and sorted by XIX-blast query. Result should be three fasta files with correpsoning blast alignments.

cat Xchr.fa | paste - - | awk '{print $1"_"NR"\n"$2}' > Xchr_numbered.fa
cat Ychr.fa | paste - - | awk '{print $1"_"NR"\n"$2}' > Ychr_numbered.fa
cat Ninespine.fa | paste - - | awk '{print $1"_"NR"\n"$2}' > Ninespine_numbered.fa


###Split chromosome wide fasta files into a directory with one region per file. Name of file will appear as fasta header with number from last step.

while read line
do
    if [[ ${line:0:1} == '>' ]]
    then
        outfile=${line#>}.fa
        echo $line > $outfile
    else
        echo $line >> $outfile
    fi
done <  Xchr_numbered.fa

while read line
do
    if [[ ${line:0:1} == '>' ]]
    then
        outfile=${line#>}.fa
        echo $line > $outfile
    else
        echo $line >> $outfile
    fi
done <  Ychr_numbered.fa

while read line
do
    if [[ ${line:0:1} == '>' ]]
    then
        outfile=${line#>}.fa
        echo $line > $outfile
    else
        echo $line >> $outfile
    fi
done < Ninespine_numbered.fa


##Use cat command to merge chromosomes for each correpsonding region based on the number in the name. ACR1.fasta should contain three sequences, X, Y, and Ninespine, of correpsoning blast alignment.

cat *_1* > ACR1.fasta


##align  wil ACRs independelty with muscle.. output should be aligned muscle fasta format between all three sequences. Be sure to spot check alignments.

module load MUSCLE/3.8.1551-GCC-8.3.0
for file in *ACR*

do
  export iden=${file%%.fa}
  export output=${iden}.fasta

muscle -in ${file} -out ${output}

done


##remove muscle alignments that are too low sequeunce idenity using geneious  Sequence identity < 60% 

##create a vcf from each multiple sequence alignment fasta

ml snp-sites/2.5.1-conda
for file in *ACR*

do
  export iden=${file%%.fasta}
  export output=${iden}.vcf

snp-sites -v ${file} > ${output}

done




##Report variants from vcf. For three alignments, VCF snps are in $10, $11, and $12. Use awk to find variants that are unique to Y. $10=0, $11=0, $12=1 = Y specific variant. Be sure to ensure order of vcf file is correct. Typically uses the order from muscle output.


for file in *ACR*

do
  export iden=${file%%.vcf}
  export output=${iden}.txt
awk '$11 == 0' ${file} > ${output}

done
