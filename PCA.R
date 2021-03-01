## load data
rm(list = ls())
dat <- read.csv("")
## 置换好数据格???
samplenames <- dat[,1]
idx <- which(duplicated(samplenames))
samplenames <- as.character(samplenames)
for( i in idx){
  samplenames[i] <- paste(samplenames[i],"-duplicate",sep= "")
}
duplicated(samplenames)
rownames(dat) <- samplenames
dat<- dat[ ,-1]

##相关性计???
cor(dat)

library(RColorBrewer) 
cols=colorRampPalette(rev(brewer.pal(11,"RdBu")))(300)
image ( cor(dat) ,col=cols,zlim=c(-1,1))

## 计算PCs
dat2 <- t(dat)
s <- svd(dat2)
plot(s$v[,1],s$v[,2],pch=16, xlab="PC1",ylab="PC2")

save(list= ls(), file = "pca")

## 
dat2<- read.csv(file = "C:\\Users\\sueface\\Desktop\\biofimfo\\tmp02\\date_sample.csv")
idx<- duplicated(dat2[,1]) %>%  which()
samplenames <- as.character(dat2[,1])
for( i in idx){
  samplenames[i] <- paste(samplenames[i],"-duplicate",sep= "")
}
dat2[,1] <- samplenames

## 看到都一一对应上了
rownames(dat)%in% samplenames %>% sum()

## 
day<- factor(substr(dates, start = 1,stop = 9))
cols<- as.numeric(day)

plot(s$v[,1],s$v[,2],pch=16, col = cols, xlab="PC1",ylab="PC2")

##就到这里算是一个尝试~，批次效应没有那么明显！
save(list= ls(), file = "pca.RData")
