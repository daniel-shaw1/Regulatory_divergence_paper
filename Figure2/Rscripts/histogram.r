ACR <- read.table("XYpermutationsACR.txt", header=TRUE, sep="\t")
perm <- read.table("XYpermutations.txt", header=TRUE, sep="\t")



# library
library(ggplot2)
library(dplyr)
library(hrbrthemes)			 
####transparent permutations			 
p<-ggplot(perm, aes(x=Y, fill=Stratum, color=Stratum)) +
  geom_histogram(position="identity", alpha=0.5, binwidth =0.0005)
p			 


p<-ggplot(perm, aes(x=X, fill=Stratum, color=Stratum)) +
  geom_histogram(position="identity", alpha=0.5, binwidth =0.0005)
p			


p<-ggplot(perm, aes(x=X, fill=Stratum, color=Stratum)) +
  geom_histogram(position="identity", alpha=0.2, binwidth =0.0003 ) + xlim(0,0.04) 
p

p + scale_fill_manual(values=c("#69b3a2", "#404080")) 

p<-ggplot(ACR, aes(x=X, fill=Stratum, color=Stratum)) +
  geom_histogram(position="identity", alpha=0.5, binwidth =0.0003)
p




###Polymorphism	

perm <- read.table("XYA_polymorphism_liver.txt", header=TRUE, sep="\t")	


p<-ggplot(perm, aes(x=Ypoly, fill=Stratum, color=Stratum)) +
  geom_histogram(position="identity", alpha=0.5)
p	  


p<-ggplot(perm, aes(x=Ypoly)) +
  geom_histogram(position="identity", alpha=0.5)
  
p<-ggplot(perm, aes(x=Xpoly)) +
  geom_histogram(position="identity", alpha=0.5)
  
p<-ggplot(perm, aes(x=18poly)) +
  geom_histogram(position="identity", alpha=0.5)

####testis

perm <- read.table("XYA_polymorphism_testis.txt", header=TRUE, sep="\t")	


p<-ggplot(perm, aes(x=Ypoly, fill=Stratum, color=Stratum)) +
  geom_histogram(position="identity", alpha=0.5)
p	  


p<-ggplot(perm, aes(x=Ypoly)) +
  geom_histogram(position="identity", alpha=0.5)
  
p<-ggplot(perm, aes(x=Xpoly)) +
  geom_histogram(position="identity", alpha=0.5)
  
p<-ggplot(perm, aes(x=Apoly)) +
  geom_histogram(position="identity", alpha=0.5)




####stratum

perm <- read.table("XY_polymorphism_liver_stratum.txt", header=TRUE, sep="\t")	


p<-ggplot(perm, aes(x=Ypoly, fill=Stratum, color=Stratum)) +
  geom_histogram(position="identity", alpha=0.5)
p	  


p<-ggplot(perm, aes(x=Xpoly, fill=Stratum, color=Stratum)) +
  geom_histogram(position="identity", alpha=0.5)
p	  


perm <- read.table("XY_polymorphism_testis_stratum.txt", header=TRUE, sep="\t")	


p<-ggplot(perm, aes(x=Ypoly, fill=Stratum, color=Stratum)) +
  geom_histogram(position="identity", alpha=0.5, binwidth=0.00001)
p	  


p<-ggplot(perm, aes(x=Xpoly, fill=Stratum, color=Stratum)) +
  geom_histogram(position="identity", alpha=0.5, binwidth=0.00001)
p	  
