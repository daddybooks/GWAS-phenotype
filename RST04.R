dat<- read.csv(file = "./tmp19LEI.csv", header = F)

dat[,1]
idx <- seq(1,by = 12,length.out = 81)
samplenames<- dat[,1][idx]
duplicated(samplenames) %>% sum()
samplenames <- as.character(samplenames) 
## 检查样本是否有重复的粘贴导致的错误
duplicated(dat[,4][!as.character(dat[,4]) == "面积"][!dat[,4][!as.character(dat[,4]) == "面积"] %>% 
                                                   as.character() == ""])
idx<- seq(3,by= 12, length.out = 61)
peakno1 <- dat[,4]
peakno1<- as.character(peakno1)[idx]

idx<- seq(4,by= 12, length.out = 61)
peakno2 <- dat[,4]
peakno2<- as.character(peakno2)[idx]

idx<- seq(7,by= 12, length.out = 61)
peakno5 <- dat[,4]
peakno5<- as.character(peakno5)[idx]

idx<- seq(8,by= 12, length.out = 61)
peakno6 <- dat[,4]
peakno6<- as.character(peakno6)[idx]



idx<- seq(5,by= 12, length.out = 61)
peakno3 <- dat[,4]
peakno3<- as.character(peakno3)[idx]

idx<- seq(6,by= 12, length.out = 61)
peakno4 <- dat[,4]
peakno4<- as.character(peakno4)[idx]

idx<- seq(9,by= 12, length.out = 61)
peakno7 <- dat[,4]
peakno7<- as.character(peakno7)[idx]

idx<- seq(10,by= 12, length.out = 61)
peakno8 <- dat[,4]
peakno8<- as.character(peakno8)[idx]

idx<- seq(11,by= 12, length.out = 61)
peakno9 <- dat[,4]
peakno9<- as.character(peakno9)[idx]

idx <- seq(3, by = 12,length.out = 61)
peaktime1 <- as.character(dat[,3][idx])
  
idx <- seq(4, by = 12,length.out = 61)
peaktime2 <- as.character(dat[,3][idx])
  
idx <- seq(7, by = 12,length.out = 61)
peaktime5 <- as.character(dat[,3][idx])

idx <- seq(8, by = 12,length.out = 61)
peaktime6 <- as.character(dat[,3][idx])


idx <- seq(5, by = 12,length.out = 61)
peaktime3 <- as.character(dat[,3][idx])

idx <- seq(6, by = 12,length.out = 61)
peaktime4 <- as.character(dat[,3][idx])

idx <- seq(9, by = 12,length.out = 61)
peaktime7 <- as.character(dat[,3][idx])

idx <- seq(10, by = 12,length.out = 61)
peaktime8 <- as.character(dat[,3][idx])

idx <- seq(11, by = 12,length.out = 61)
peaktime9 <- as.character(dat[,3][idx])
##检查出峰时间是否正常，如果有异常需要检查数据修???
par(mfcol= c(2,2))
plot(sort(peaktime1))
plot(sort(peaktime2))
plot(sort(peaktime5))
plot(sort(peaktime6))

##处理重复的样本名???
duplicated(samplenames)
idx<- which(duplicated(samplenames))
for (i in idx) {
  samplenames[i] <- paste(samplenames[i],"-duplicate",sep = "")
  
}

## 合并成为数据框输???
dat2 <- data.frame(peakno1,peakno2,peakno5,peakno6,peakno3,peakno4,peakno7,peakno8,peakno9,peaktime1,peaktime2,peaktime5,peaktime6,peaktime3,peaktime4,peaktime7,peaktime8,peaktime9,row.names = samplenames)
write.csv(dat2 ,file = "胡萝卜素04.csv")

save(list = ls(), file ="胡萝卜素04.Rdata")
    