add_refseq <- function(a_filename) {

in_file <- read.delim(file = a_filename, stringsAsFactors = FALSE)
colnames(in_file)

gene_id <- in_file[[1]]

gene_split <- strsplit(x=gene_id, split="_")

gene_symbol <- unlist( lapply(gene_split, head, n=1L))

refseq_split <- lapply(gene_split, tail, n=2L)
refseq_split <- lapply(refseq_split, function (e) paste(e, collapse="_"))

gene_refseq <- unlist(refseq_split)

if (nrow(in_file) != length(gene_symbol)) stop("the split went wrong")
if (nrow(in_file) != length(refseq)) stop("the split went wrong")

out_file <- cbind(in_file, gene_symbol, gene_refseq)
names_of_cols <- names(out_file)
names_of_cols <- gsub(pattern="X", replacement="gene_id", names_of_cols)
names(out_file) <- names_of_cols


new_filename <- substr(x=a_filename, start=1, stop=nchar(a_filename)-4)
new_filename <- paste0(new_filename,"_RefSeq.txt")
new_filename <- gsub(pattern="raw", replacement="tercen", new_filename)

write.table(file=new_filename, out_file, row.names =FALSE, quote = FALSE, sep = "\t")
}


f1 <- "data\\raw\\Top_FvsP11.txt"
f2 <- "data\\raw\\Top_FvsWT11.txt"
f3 <- "data\\raw\\Top_PvsWT11.txt"

add_refseq(f1)
add_refseq(f2)
add_refseq(f3)
