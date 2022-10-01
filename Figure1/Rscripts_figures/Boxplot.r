
  
ggboxplot(comp, x = "Ydivergence", y = "Sites",
          color = "Stratum", palette = "jco")+ 
  stat_compare_means(comparisons = my_comparisons, label.y = c(29, 35, 40))+
  stat_compare_means(label.y = 45)
					   

  
  
  #stats for boxplot
  compare_means(Ydiv~Sex, data = comp, 
              group.by = "Stratum")
			  
p <- ggboxplot(comp, x = "Stratum", y = "Ydiv",
          color = "Sex", palette = "jco",)
# Use only p.format as label. Remove method name.
p + stat_compare_means(label = "p.format")			  
p + stat_compare_means(label =  "p.signif", label.x = .99)
