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

# genomes_count <- length(colnames(gpa))
# absence_presence <- cbind(gpa,rowSums(gpa))
# 
# summary_table <- matrix(data=NA,nrow=3,ncol=length(colnames(absence_presence)))
# colnames(summary_table) <- colnames(absence_presence)
# rownames(summary_table) <- c("Total_genes","Unique_genes","Core_genes")
# 
# summary_table[1,] <- colSums(absence_presence)
# summary_table[2,] <- colSums(absence_presence[which(absence_presence[,ncol(absence_presence)] == 1),])
# summary_table[3,] <- colSums(absence_presence[which(absence_presence[,ncol(absence_presence)] >= (genomes_count*0.95)),])
# summary_table <- summary_table[,-ncol(summary_table)]
# 
# average_table <- data.frame(x=1:6, y=1:6, z=1:6)
