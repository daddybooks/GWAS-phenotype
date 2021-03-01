dat<- read.csv("单双糖合并.csv")
as.character(dat[,1])
dat2 <- dat
nametmp<- gsub("\\(.*\\)", replacement = "", x = as.character(dat[,1]))
nametmp<- gsub("-.*",replacement = "", x = nametmp)
dat2[,1] <- nametmp
dat2<- dat2[,1:4]
##读取列表中的样本名genotype 并处理小毛病“空格”
nameinfo<- read.csv("GWAS信息表.csv")[,1]
nameinfo<- as.character(nameinfo)
nameinfo<- gsub(" ",replacement = "", x= nameinfo)
## 只要在列表中出现过的名本的数据
idx<- nametmp %in% nameinfo %>% which()
dat2<- dat2[idx, ]

##求平均值，要检查有没有标准差比较大的样本
tmp<- tapply(dat2$peakno1, INDEX = dat2$X, FUN = sd)
plot(tmp)
text(tmp, y=NULL ,labels = names(tmp))
##找到单瓜记录
names(tmp)[which(rowSums(as.data.frame(tmp) %>%is.na())>0)]

## 先把标准差大于6W的样本剔除掉
na.omit(as.data.frame(tmp)[,1]>60000 ) %>% sum ##要去除46个样本
idx<- na.omit(as.data.frame(tmp)[,1]>60000 ) %>% which()
rmnames <- rownames(na.omit(as.data.frame(tmp ) ) )[idx]
dat2[which(!dat2[,1]%in% rmnames ), ] %>% nrow()  ##去除了46个样本包括他们的重名样本后剩下181个记录
dat2<- dat2[which(!dat2[,1]%in% rmnames ), ] 
## 完成剔除的样本进行均值的计算
dat_out<- tapply(X = dat2$peakno1 ,INDEX = dat2$X,FUN = mean) %>% as.data.frame()
peakno2 <- tapply(X = dat2$peakno2 ,INDEX = dat2$X,FUN = mean) %>% as.character()
peakno3 <- tapply(X = dat2$peakno3 ,INDEX = dat2$X,FUN = mean) %>% as.character()
dat_out<- cbind(dat_out,peakno2,peakno3)
dat_out<- cbind(rownames(dat_out), dat_out)
colnames(dat_out) <- c("样本名称", "peakno1","peakno2", "peakno3")
## 对原有的数据名字进行匹配，先对数据进行读取
## 这里读取的数据还是有“空格”，必须要处理！
genotype <- read.csv("GWAS信息表.csv")
genotype[,1] <- nameinfo
x<- left_join(genotype, dat_out, by = "样本名称")


## 查找缺失的样本名字
containnammes<- c(rownames(dat_out), rmnames)
genotype$样本名称[!(genotype$样本名称 %in%containnammes)]

