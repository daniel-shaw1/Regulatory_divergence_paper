Exp <- read.table("ACR-exp-str.txt", header=TRUE, sep="\t")
Testisexp <- read.table("X_ACR_Testis_exp.txt", header=TRUE, sep="\t")
TestisexpY <- read.table("Y_ACR_Testis_exp.txt", header=TRUE, sep="\t")

with(Liver, cor(Yacr, Liver))

###XvsY testis P =0.0771
cocor(~ Name + log2xy | Div + Exp,
      data = list(TestisexpY, Testisexp))
	  
###XvsY Liver	  P = 0.5899
cocor(~ X + Liver | Y + Liver,
      data = list(Exp, Exp))

##LiverX vs Testis X	  P =0.0482
cocor(~ X + Liver | Div + Exp,
      data = list(Exp, Testisexp))
###LiverY vs Testis Y	  P = 0.59
cocor(~ Y + Liver | Name + log2xy,
      data = list(Exp, TestisexpY))
