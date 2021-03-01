## 计算重复的SD值
dat<- read.csv("../../tmp_suger.csv",stringsAsFactors = F)

samplenames <- dat[,1]
samplenames <- gsub("\\(.*\\)", replacement = "", x = as.character(samplenames))
samplenames <- gsub("-.*", replacement = "", x = samplenames) 
samplenames <- gsub("huai", replacement = "" ,x = samplenames) 
samplenames <- gsub("HUAI", replacement = "" ,x = samplenames) 
samplenames <- gsub("坏", replacement = "", x = samplenames )
samplenames <- gsub("（.*）", replacement ="" , x= samplenames )

dat[,1] <- samplenames
dat_mat02<- dat_mat02[,-1]

## 计算SD
tmp_sd<- data.frame(1:268)
for ( i in 1:3){
  a<- tapply(X = dat_mat02[,i] ,INDEX =  dat$Sample ,FUN = sd) %>% data.frame()
  tmp_sd<- cbind(tmp_sd,a)
}
rownames(tmp_sd) <- rownames( tapply(X = dat_mat02[,i] ,INDEX =  dat$X,FUN = sd) %>% data.frame())

## 计算mean
tmp_mean<- data.frame(1:268)

for ( i in 1:3){
  a<- tapply(X = dat_mat02[,i] ,INDEX =  dat$Sample,FUN = mean) %>% data.frame()
  tmp_mean<- cbind(tmp_mean,a)
}
rownames(tmp_mean) <- rownames( tapply(X = dat_mat01[,i] ,INDEX =  dat$X,FUN = mean) %>% data.frame())
write.table(tmp_mean,file = "../../tmp.csv",sep = ",")
    