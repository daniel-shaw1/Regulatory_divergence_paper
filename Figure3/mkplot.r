mktestis <- read.delim("mkresults_testis.txt")
mk <- read.delim("mkresults_liver.txt")

  
 ggplot(mk, aes(x = Labels, y = NI, ymin = NI - stdevN, ymax = NI + stdevN)) +
  geom_point(size = 3, color = "black") +
  geom_errorbar(width = 0.3) +
   ylim(c(-0.5, 3)) +
  xlab("Group") +
  ylab("Average") +
  ggtitle("Average with Standard Deviation") +
  theme_minimal()
  
  
  ggplot(mktestis, aes(x = Labels, y = NI, ymin = NI - stdevN, ymax = NI + stdevN)) +
  geom_point(size = 3, color = "black") +
  geom_errorbar(width = 0.3) +
  ylim(c(-0.5, 3)) +
  xlab("Group") +
  ylab("Average") +
  ggtitle("Average with Standard Deviation") +
  theme_minimal()
 
