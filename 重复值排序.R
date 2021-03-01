dat<- read.csv("类胡萝卜素2019年HPLC数据.csv")
samplenames <- dat[,1]
samplenames <- gsub("\\(.*\\)", replacement = "", x = as.character(samplenames))
samplenames <- gsub("-.*", replacement = "", x = samplenames) 
samplenames <- gsub("huai", replacement = "" ,x = samplenames) 
samplenames <- gsub("HUAI", replacement = "" ,x = samplenames) 
samplenames <- gsub("坏", replacement = "", x = samplenames )
samplenames <- gsub("（.*）", replacement ="" , x= samplenames )
last_all_rec<- dat[which(samplenames %in% year_last),]

last_all_rec_cnames <- last_all_rec[,1]
last_all_rec_cnames <- gsub("\\(.*\\)", replacement = "", x = as.character(last_all_rec_cnames))
last_all_rec_cnames <- gsub("-.*", replacement = "", x = last_all_rec_cnames) 
last_all_rec_cnames <- gsub("huai", replacement = "" ,x = last_all_rec_cnames) 
last_all_rec_cnames <- gsub("HUAI", replacement = "" ,x = last_all_rec_cnames) 
last_all_rec_cnames <- gsub("坏", replacement = "", x = last_all_rec_cnames )
last_all_rec_cnames <- gsub("（.*）", replacement ="" , x= last_all_rec_cnames )


a<- data.frame()

for (i in accor_name) {
    if(any(i == last_all_rec_cnames )){
      a<- rbind(a,last_all_rec[which(i == last_all_rec_cnames),])
    }
    else{
      a <- rbind(a,(i))
    }

}
write.csv(x= a ,file = "../tmp_comp.csv")
    