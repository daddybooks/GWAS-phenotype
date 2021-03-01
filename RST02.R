dat<- read.csv(file = "C:\\Users\\Administrator\\Desktop\\bioimformatics\\2019南瓜GWAS分析数据\\tmp12suger.csv", header = F)
dat[,1]
idx <- seq(1,by = 6,length.out = 103)
samplenames<- dat[,1][idx]
duplicated(samplenames) %>% sum()
  samplenames <- as.character(samplenames) 
## ???6个样本名是重复的
dat
seq(1:2, by= 2, length.out = 243)
## 检查样本是否有重复的粘贴导致的错误
duplicated(dat[,4][!as.character(dat[,4]) == "面积"][!dat[,4][!as.character(dat[,4]) == "面积"] %>% 
    as.character() == ""])

idx<- seq(3,by= 6, length.out = 243)
peakno1 <- dat[,4]
peakno1<- as.character(peakno1)[idx]

idx<- seq(4,by= 6, length.out = 243)
peakno2 <- dat[,4]
peakno2<- as.character(peakno2)[idx]

idx<- seq(5,by= 6, length.out = 243)
peakno3 <- dat[,4]
peakno3<- as.character(peakno3)[idx]

idx <- seq(3, by = 6,length.out = 243)
peaktime1 <- as.character(dat[,3][idx])

idx <- seq(4, by = 6,length.out = 243)
peaktime2 <- as.character(dat[,3][idx])

idx <- seq(5, by = 6,length.out = 243)
peaktime3 <- as.character(dat[,3][idx])
##检查出峰时间是否正常，如果有异常需要检查数据修???
mpar(2,2)
plot(sort(peaktime1))
plot(sort(peaktime2))
plot(sort(peaktime3))

##处理重复的样本名???
duplicated(samplenames)
idx<- which(duplicated(samplenames))
for (i in idx) {
  samplenames[i] <- paste(samplenames[i],"-duplicate",sep = "")
  
}
## 合并成为数据框输???
dat2 <- data.frame(peakno1,peakno2,peakno3,peaktime1,peaktime2,peaktime3,row.names = samplenames)
write.csv(dat2 ,file = "单双糖05.csv")

save(list = ls(), file = "单双糖05.RData")
