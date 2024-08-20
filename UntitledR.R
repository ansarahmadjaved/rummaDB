library(clusterProfiler)
library(data.table)
file = fread('RummaDB.csv')
head(file)

df_n = file[file$value == -1]
df = file[file$value == 1]

file$value <- ifelse(grepl("up", file$term), 1, -1)
head(file)
file$term <- gsub(" up| dn", "", file$term)

pivot_table <- table(df$term, df$gene) * df$value


pivot_df <- dcast(file, term ~ gene, value.var = "value", fill = 0)
head(file)
