library(dendextend)
library(dplyr)

anges <- "/Users/malcolmorian/Documents/Bioinformatics/Projects2023/Metagenomics/2023.10.10.Analysis/panaroo/gene_presence_absence_filt_pseudo_length_frag.Rtab"
df <- read.table(anges,header = TRUE)
nrow(df)
View(df[,-1])

matrix <- t(as.matrix(df[,-1]))

View(matrix)

# Calculate hierarchical clustering
dist_matrix <- dist(matrix, method = "binary")
hc <- hclust(dist_matrix, method = "complete")

ordered_matrix <- matrix[, hc$order]

# Create the heatmap
heatmap(ordered_matrix, 
        Colv = as.dendrogram(hc),   # Display column dendrogram
        Colv.lines = 0,             # Remove lines for column dendrogram
        scale = "none",            # You can scale the data if necessary
        main = "Hierarchical Heatmap of Presence-Absence Matrix",
        col = c("white", "black"), labCol = FALSE, xlab = "Genes")

# Add a legend for "Present" and "Absent" on the side
legend("left", legend = c("Present", "Absent"), fill = c("black", "white"), title = "Legend")


# Create a dendrogram object
#dend <- as.dendrogram(hc)

# Plot the dendrogram
#plot(dend, main = "Hierarchical Clustering Dendrogram", xlab = "Samples", ylab = "Distance")

