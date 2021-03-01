## 现在要把HPLC数据的编号一一对应上去 数据LIKE
rm(list = ls())
dat<- read.csv("类胡萝卜素2019年HPLC数据.csv")
dat[,1]
samplenames <- dat[,1]
samplenames <- gsub("\\(.*\\)", replacement = "", x = as.character(samplenames))
samplenames <- gsub("-.*", replacement = "", x = samplenames) 
samplenames <- gsub("huai", replacement = "" ,x = samplenames) 
samplenames <- gsub("HUAI", replacement = "" ,x = samplenames) 
samplenames <- gsub("坏", replacement = "", x = samplenames )
samplenames <- gsub("（.*）", replacement ="" , x= samplenames )
## 去掉空格
year_last <- gsub(" ",replacement = "", x = year_last)
## 检查有没有上半年的数据有多少是匹配上的
samplenames %in% year_last
year_last %in% samplenames %>% sum()
year_last[!year_last %in% samplenames] ##找不到的样品

## 找到的留下来
last_all_rec<- dat[which(samplenames %in% year_last),]



## 对下半年的做同样的事情
year_next %in% samplenames %>% sum()
## 去掉空值
year_next <- year_next[which(!year_next == "")]
## 替换X
year_next<- gsub("\\*", replacement = "x",x = year_next)
## 替换-
year_next<- gsub("-.*",replacement = "" ,x = year_next)
## 替换“自交”
year_next<- gsub("\\?", replacement = "自交",x = year_next)


year_next[!year_next %in% samplenames ]

## 找到的留下来

next_all_rec<- dat[which(samplenames %in% year_next),]

## 创建样本名（单纯的形式）
last_all_rec_cnames <- last_all_rec[,1]
last_all_rec_cnames <- gsub("\\(.*\\)", replacement = "", x = as.character(last_all_rec_cnames))
  last_all_rec_cnames <- gsub("-.*", replacement = "", x = last_all_rec_cnames) 
  last_all_rec_cnames <- gsub("huai", replacement = "" ,x = last_all_rec_cnames) 
  last_all_rec_cnames <- gsub("HUAI", replacement = "" ,x = last_all_rec_cnames) 
  last_all_rec_cnames <- gsub("坏", replacement = "", x = last_all_rec_cnames )
  last_all_rec_cnames <- gsub("（.*）", replacement ="" , x= last_all_rec_cnames )

## 创建一个list，并且把251个上半年的送去测序的样本名 并且他们的表型数据导入列表
z <- vector( mode = "list" )


for (i in 1:268) {
 z[[year_last[i]]]<- last_all_rec[last_all_rec_cnames == year_last[i],]
}

## 把没有重复的数据先mapping到我们的251个表型数据上面
dat_out <- as.data.frame(names(z))
names(dat_out) <- "X"
x <- last_all_rec
x[,1] <- last_all_rec_cnames
idx <-  tapply(x$peakno1, INDEX = x$X, FUN = sd) %>% is.na()

idx <- which(last_all_rec_cnames%in% names(tapply(x$peakno1, INDEX = x$X, FUN = sd))[idx])

last_all_rec[idx,]

dat_out<- left_join(dat_out, x[idx,], by = "X")

## 输出数据
write.csv(x = dat_out,file = "上半年GWAS群体表型_单双糖.csv")

#保存
save(list = ls() ,file = "HPLC上下半年数据mapping.Rdata")

## 
