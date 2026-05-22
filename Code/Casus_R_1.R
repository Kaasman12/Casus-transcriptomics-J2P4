setwd("C:/Users/boazp/OneDrive - NHL Stenden/Transcriptomics werccolleges/Casus")
getwd()

library(BiocManager)
library(Rsubread)
library(Rsamtools)
library(DESeq2)
library(KEGGREST)
library(EnhancedVolcano)
library(pathview)


# Referentie genoom indexeren
buildindex(
  basename = 'ref_Man',
  reference = 'GCF_000001405.40_GRCh38.p14_genomic.fna',
  memory = 10000,
  indexSplit = TRUE)

# alignen van de samples
align.Norm1 <- align(index = "ref_man", readfile1 = "SRR4785819_1_subset40k.FASTQ", readfile2 = "SRR4785819_2_subset40k.FASTQ", output_file = "Norm1.BAM")
align.Norm2 <- align(index = "ref_man", readfile1 = "SRR4785820_1_subset40k.FASTQ", readfile2 = "SRR4785820_2_subset40k.FASTQ", output_file = "Norm2.BAM")
align.Norm3 <- align(index = "ref_man", readfile1 = "SRR4785828_1_subset40k.FASTQ", readfile2 = "SRR4785828_2_subset40k.FASTQ", output_file = "Norm3.BAM")
align.Norm4 <- align(index = "ref_man", readfile1 = "SRR4785831_1_subset40k.FASTQ", readfile2 = "SRR4785831_2_subset40k.FASTQ", output_file = "Norm4.BAM")

align.RA1 <- align(index = "ref_man", readfile1 = "SRR4785979_1_subset40k.FASTQ", readfile2 = "SRR4785979_2_subset40k.FASTQ", output_file = "RA1.BAM")
align.RA2 <- align(index = "ref_man", readfile1 = "SRR4785980_1_subset40k.FASTQ", readfile2 = "SRR4785980_2_subset40k.FASTQ", output_file = "RA2.BAM")
align.RA3 <- align(index = "ref_man", readfile1 = "SRR4785986_1_subset40k.FASTQ", readfile2 = "SRR4785986_2_subset40k.FASTQ", output_file = "RA3.BAM")
align.RA4 <- align(index = "ref_man", readfile1 = "SRR4785988_1_subset40k.FASTQ", readfile2 = "SRR4785988_2_subset40k.FASTQ", output_file = "RA4.BAM")


allsamples <- c("Norm1.BAM", "Norm2.BAM", "Norm3.BAM", "Norm4.BAM", "RA1.BAM", "RA2.BAM", "RA3.BAM", "RA4.BAM" )


count_matrix <- featureCounts(
  files = allsamples,
  annot.ext = "genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.featureType = "gene", 
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE
)

str(count_matrix)


# verder gaan met de grote count matrix van dewi
counts <- read.delim(
  "count_matrix_RA.txt",
  row.names = 1
)
head(counts)

treatment <- c("niks", "niks", "niks", "niks", "reuma", "reuma", "reuma", "reuma")
treatment_table <- data.frame(treatment)

rownames(treatment_table) <- c('SRR4785819', 'SRR4785820', 'SRR4785828', 'SRR4785831', 'SRR4785979', 'SRR4785980', 'SRR4785986', 'SRR4785988')
head(treatment_table)

dds <- DESeqDataSetFromMatrix(countData = counts,
                              colData = treatment_table,
                              design = ~ treatment)
#analyse
dds <- DESeq(dds)
resultaten <- results(dds)

write.table(resultaten, file = 'Resultatencasus.csv', row.names = TRUE, col.names = TRUE)

sum(resultaten$padj < 0.05 & resultaten$log2FoldChange > 1, na.rm = TRUE)
sum(resultaten$padj < 0.05 & resultaten$log2FoldChange < -1, na.rm = TRUE)

#sorteren
hoogste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = TRUE), ]
laagste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = FALSE), ]
laagste_p_waarde <- resultaten[order(resultaten$padj, decreasing = FALSE), ]

#plotten
EnhancedVolcano(resultaten,
                lab = rownames(resultaten),
                x = 'log2FoldChange',
                y = 'padj')
#plot opslaan
dev.copy(png, 'VolcanoplotWC.png', 
         width = 8,
         height = 10,
         units = 'in',
         res = 500)
dev.off()




#Go analyse voorberieding gedoe:
library(clusterProfiler)
library(org.Hs.eg.db)
library(enrichplot)

sig_genes <- resultaten[
  !is.na(resultaten$padj) &
    !is.na(resultaten$log2FoldChange) &
    resultaten$padj < 0.05 &
    abs(resultaten$log2FoldChange) > 1,
]

head(sig_genes)

gene_df <- bitr(
  rownames(sig_genes),
  fromType = "SYMBOL",
  toType = "ENTREZID",
  OrgDb = org.Hs.eg.db
)

head(gene_df)

gene_list <- rownames(sig_genes)

head(gene_list)
library(clusterProfiler)
library(enrichplot)

#GO gedoe
ego <- enrichGO(
  gene = gene_df$ENTREZID,
  OrgDb = org.Hs.eg.db,
  ont = "BP",
  pAdjustMethod = "BH",
  pvalueCutoff = 0.05,
  readable = TRUE
)

head(ego)
ego@result

dotplot(ego)
barplot(ego)

#kegg gedoe
kk <- enrichKEGG(
  gene = gene_df$ENTREZID,
  organism = "hsa",
  pvalueCutoff = 0.05
)

dotplot(kk)

#pathview gedoe
foldchanges <- sig_genes$log2FoldChange

names(foldchanges) <- rownames(sig_genes)

fc_mapped <- foldchanges[gene_df$SYMBOL]

names(fc_mapped) <- gene_df$ENTREZID

head(fc_mapped)

pathview(
  gene.data = fc_mapped,
  pathway.id = "hsa05323", #Reumatoide artritis
  species = "hsa",
  gene.idtype = "ENTREZ"
)

kk@result$ID[1]

pathview(
  gene.data = fc_mapped,
  pathway.id = "hsa04621", #NOD-like receptor signaling pathway
  species = "hsa",
  gene.idtype = "ENTREZ"
)

