library(ggplot2)
library(dplyr)
library(reshape2)

res <- read.table("scholar2014_freq.txt", sep = '\t', header = T)
# colnames(res) <- c("Year", "Molecular Epidemiology", "Genetic Epidemiology", "Genomic Epidemiology", "Traditional Epidemiology")

plot.new()
g <- ggplot(res2, aes(x = res2$Year, y = res2$Delta, colour = res2$Variable, group = res2$Variable ))
g <- g + geom_smooth(size = 1.5, fill = NA, method = "loess")
g <- g + theme_bw() 
g <- g + theme(axis.text.x =element_text(angle = 45, hjust = 1 ))
g <- g + theme(panel.background= element_blank(), panel.grid.minor = element_line(colour='lightgrey'))
g <- g + coord_cartesian(ylim = c(-0.5, 0.75))
# g <- g + 
plot(g)



library(rCharts)


df <- read.table("scholar2014.txt", sep = '\t', header = T)
colnames(df) <- c("Year", "Molecular Epidemiology", "Genetic Epidemiology", "Genomic Epidemiology", "Traditional Epidemiology")
df <- melt(df, "Year")
m1a <- nPlot(x = "Year",
             data = df,
             y = "value",
             group = "variable",
             type = "lineChart")
# m1a$set(pointSize = 0)
# m1a$set(hideHover = "auto")
m1a$yAxis(axisLabel = "Total Citations")
m1a$xAxis(axisLabel = "Year")

m1a$set(disabled = c(T,T,F,T))
m1a$save('scholar2.html')

library(knitr)
opts_chunk$set(comment = NA, results = "asis", comment = NA, tidy = F)
knit2html(m1a$show('iframesrc', cdn = TRUE))


write.table(embed, "scholar.html")
source_url("https://raw.github.com/walkerke/teaching-with-datavis/master/tfr-in-europe.R")



