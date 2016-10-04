library(reshape2)

inFile<-read.delim(file="data\\raw\\counts.genes11.txt", header=FALSE#vaiable it loads is is "y" a DGEList object
#y$counts,y$genes, y$samples

SampleNames<-c("Gene_Symbol_RefSeq","WT_0","WT_1","WT_2","F408del_0","F408del_1", "F408del_2","P544L_0","P544L_1","P544L_2","Y262X","Del")
colnames(inFile)<-SampleNames

out_long_format<-melt(inFile)


namesOfCols<-c("Gene_Symbol_RefSeq", "Mutation_Replicate", "count")
colnames(out_long_format)<-namesOfCols
write.table(file="data\\tercen\\counts_genes11_long_format.txt", out_long_format,row.names=FALSE,quote=FALSE, sep="\t")
