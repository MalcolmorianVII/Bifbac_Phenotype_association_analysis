library(gplots)
gene_presence_absence <- read.table(file.choose(),header = TRUE)

View(gene_presence_absence)
head(gene_presence_absence,1)
class(gene_presence_absence)
summary(gene_presence_absence)
str(gene_presence_absence)

rownames(gene_presence_absence) <- gene_presence_absence$Gene
gene_presence_absence <- as.matrix(gene_presence_absence[,-1])



heatmap.2(gene_presence_absence,
          Colv = T,
          scale="none",
          col="bluered",
          trace="none",
          main="Absence/Presence of genes",
          density.info = "none",
          labRow = FALSE
          )
  