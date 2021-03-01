rm(list = ls())
dat<- read.csv("单双糖合并_ADD03.csv")
dat[,1]
samplenames <- dat[,1]
samplenames <- gsub("\\(.*\\)", replacement = "", x = as.character(samplenames))
samplenames <- gsub("-.*", replacement = "", x = samplenames) 
samplenames <- gsub("huai", replacement = "" ,x = samplenames) 
samplenames <- gsub("坏", replacement = "", x = samplenames )
samplenames <- gsub("（.*）", replacement ="" , x= samplenames )
year_last <- readClipboard()
## 找到的留下来
last_all_rec<- dat[which(samplenames %in% year_last),]

last_all_rec_cnames <- last_all_rec[,1]
last_all_rec_cnames <- gsub("\\(.*\\)", replacement = "", x = as.character(last_all_rec_cnames))
last_all_rec_cnames <- gsub("-.*", replacement = "", x = last_all_rec_cnames) 
last_all_rec_cnames <- gsub("huai", replacement = "" ,x = last_all_rec_cnames) 
last_all_rec_cnames <- gsub("坏", replacement = "", x = last_all_rec_cnames )
last_all_rec_cnames <- gsub("（.*）", replacement ="" , x= last_all_rec_cnames )

last_all_rec[,1] <- last_all_rec_cnames
dup<-data.frame(table(last_all_rec$X)) 
dup<-subset(dup,dup$Freq>1)


for(i in 1:nrow(dup)){
  row_number<-which(last_all_rec$X==dup[,1][i]) #将gene中geneID和dup【i】相同的行的行数存入row.number中
  last_all_rec<-last_all_rec[-row_number,] #在gene中删除geneID和dup【i】相同的行
  duplicate<-last_all_rec[row_number,] #将gene中geneID和dup【i】相同的行存入duplicate中
  duplicate$mean<-apply(duplicate[,2:nrow(duplicate)],1,mean) #将duplicate的第二列到最后一列的值求平均存入新加列mean中
  duplicate<-subset(duplicate,duplicate$mean==max(duplicate$mean),select=-mean) #保留duplicate中mean最大的列 之后删除mean列
  last_all_rec<-rbind(last_all_rec,duplicate) #将duplicate加在gene的最后一行中
}
