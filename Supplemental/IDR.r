####Based off of https://ccg.epfl.ch/var/sib_april15/cases/landt12/idr.html#hide2


source("functions-all-clayton-12-13.r")
##Read peak files and genome table:

peakfile1 <- "L1M_filteredpeaks.xls"
peakfile2 <- "L2M_filteredpeaks.xls"

chr.size <- read.table("genome_table.txt")
##Define parameters:
half.width <- NULL
overlap.ratio <- 0
is.broadpeak <- F
sig.value <- "p.value"



##[half.width]: Set this to -1 (NULL) if you want to use the reported peak width in the peak files.
##[overlap.ratio]: fractional bp overlap (ranges from 0 to 1) between peaks in replicates to be considered as overlapping peaks. IMPORTANT: This parameter has not been tested fully. It is recommended to set this to 0.
##[is.broadpeak]: Is the peak file format narrowPeak or broadPeak. Set to F if it is narrowPeak/regionPeak or T if it is broadPeak.
##[ranking.measure] is the ranking measure to use. It can take only one of the following values signal.value, p.value or q.value.



##Process data and generate IDR output.
rep1 <- process.narrowpeak(paste(peakfile1, sep=""), chr.size, 
	half.width=half.width, summit="offset", broadpeak=is.broadpeak)
rep2 <- process.narrowpeak(paste(peakfile2, sep=""), chr.size, 
	half.width=half.width, summit="offset", broadpeak=is.broadpeak)
uri.output <- compute.pair.uri(rep1$data.cleaned, rep2$data.cleaned, 
	sig.value1=sig.value, sig.value2=sig.value, overlap.ratio=overlap.ratio)
em.output <- fit.em(uri.output$data12.enrich, fix.rho2=T)
idr.local <- 1-em.output$em.fit$e.z
IDR <- c()
o <- order(idr.local)
IDR[o] <- cumsum(idr.local[o])/c(1:length(o))
idr_output <- data.frame(chr1=em.output$data.pruned$sample1[, "chr"],
                    start1=em.output$data.pruned$sample1[, "start.ori"],
                    stop1=em.output$data.pruned$sample1[, "stop.ori"],
                    sig.value1=em.output$data.pruned$sample1[, "sig.value"],   
                    chr2=em.output$data.pruned$sample2[, "chr"],
                    start2=em.output$data.pruned$sample2[, "start.ori"],
                    stop2=em.output$data.pruned$sample2[, "stop.ori"],
                    sig.value2=em.output$data.pruned$sample2[, "sig.value"],
                    idr.local=1-em.output$em.fit$e.z, IDR=IDR)



write.table(idr_output, "idr_overlapped_peaks.txt", sep="", quote=F)



##Getting peaks that pass the IDR threshold:
filtered_peaks <- idr_output[idr_output[,10]<=0.01,]
dim(filtered_peaks) # get the number of peaks




###plot

ez.list <- get.ez.tt.all(em.output, uri.output$data12.enrich$merge1, uri.output$data12.enrich$merge2)
par(mar=c(5,5,0,0.5), mfrow = c(1,3), oma=c(5,0,2,0))
idr_output$col[idr_output[,10]<=0.1]="red"
idr_output$col[idr_output[,10]>=0.1]="black"
plot(log(idr_output[,4]),log(idr_output[,8]),col=idr_output[,11], pch=20, 
	xlab="log(signal) Rep1", ylab="log(signal) Rep2")
legend("topleft", c("IDR=>0.1","IDR<=0.1"), col=c("black","red"), pch=20, 
	bty="n", lty=c(1,1), lwd=c(2,2))
plot(rank(-idr_output[,4]),rank(-idr_output[,8]),col=idr_output[,11], pch=20, 
	xlab="Peak rank Rep1", ylab="Peak rank Rep2")
legend("topleft", c("IDR=>0.1","IDR<=0.1"), col=c("black","red"), pch=20, 
	  bty="n", lty=c(1,1), lwd=c(1,1))
plot(ez.list$IDR, ylab="IDR", xlab="num of significant peaks")
