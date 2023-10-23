library(gplots)
gpa <- read.table(file.choose(),header = TRUE)

View(gpa)
head(gpa,1)
class(gpa)
summary(gpa)
str(gpa)

rownames(gpa) <- gpa$Gene
gpa <- as.matrix(gpa[,-1])

heatmap(gpa)

heatmap(gpa,Colv = T,
        Rowv = NA,scale="column")

heatmap(gpa,Colv = T,
        Rowv = NA,scale="none")


heatmap.2(gpa,col = c("#FFE986","#FF736E"), main = "Absence/Presence of genes", trace="none")

heatmap.2(gpa,
          Colv = T,
          scale="none",
          col="bluered",
          trace="none",
          main="Absence/Presence of genes",
          density.info = "none",
          labRow = FALSE
          )
