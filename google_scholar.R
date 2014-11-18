library(ggplot2)
library(dplyr)
library(reshape2)

res <- read.table("g_scholar_results.txt", sep = '\t', header = T)
colnames(res) <- c("Year", "Molecular Epidemiology", "Genetic Epidemiology", "Genomic Epidemiology")
View(res)
res2 <- melt(res)
plot.new()
g <- ggplot(res2, aes(x = res2$Year, y = res2$value, colour = res2$variable, group = res2$variable ))
g <- g + geom_line()  
g <- g + theme_bw()
g <- g + theme(axis.text.x =element_text(angle = 45, hjust = 1 ))

g <- g + theme(panel.background= element_blank(), panel.grid.minor = element_line(colour='lightgrey'))




plot(g)

