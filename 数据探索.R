dat2<- read.csv("C:\\Users\\sueface\\Desktop\\biofimfo\\tmp02\\单双糖合并.csv")
dat<- readxl::read_xlsx(path = "C:\\Users\\sueface\\Desktop\\biofimfo\\tmp02\\GWAS晚造开瓜数据.xlsx",sheet = 1)
## 探索开瓜数据跟现有的单双糖的数据的出入
nametmp<- gsub("\\(.*\\)", replacement = "", x = as.character(dat2[,1]))
  nametmp <- gsub("-duplicate", replacement = "", x = nametmp) 
  nametmp <- gsub("huai", replacement = "" ,x = nametmp) 
  nametmp <- gsub("坏", replacement = "", x = nametmp )
  nametmp <- gsub("（.*）", replacement ="" , x= nametmp )
  
## 要把两个季节的瓜名字都列出来先
KGnames1 <- dat[,1]
KGnames1<- as.data.frame(KGnames1)[,1]
KGnames1<- KGnames1[-1]
KGnames1 <- gsub("（.*）", replacement = "", x= KGnames1)

KGnamesum<-c(KGnames1, KGnames)

KGnamesum<- gsub("\\(.*\\)", replacement = "", x= KGnamesum)
KGnamesum <- gsub("-.*", replacement = "", x= KGnamesum)


## 
LHLBnames<- as.character(read.csv(file = "C:\\Users\\sueface\\Desktop\\biofimfo\\tmp02\\LHLBnames.csv")[,1])
LHLBnames
LHLBnames<- gsub("\\(.*\\)", replacement = "", x= LHLBname)
LHLBnames <- gsub("-.*", replacement = "", x= LHLBnames)
## 再表型表中出现，但目前还没再HPLC上有的样本名！！！
unique(KGnamesum)[which(!unique(KGnamesum) %in% LHLBnames)]

write.csv(x= KGnamesum, file = "开瓜名字总汇.csv")
write.csv(x= unique(KGnamesum)[which(!unique(KGnamesum) %in% LHLBnames)],file = "要去找的冰箱的瓜名.csv")

## 如何找到因为输入错误而因为HPLC上的数据名字对应不上表型表里的名称?
write.excel(c(na.omit(matchnames[,1]),matchnames[,2]))

GEnamesum<- readClipboard()
GEnamesum<- gsub(pattern = "-.*", replacement = "",x= GEnamesum)
GEnamesum<- gsub(pattern = "\\*", replacement = "x",x= GEnamesum)

nametmp [which( !nametmp %in% GEnamesum )] %>% unique()

##A 是下半年的编号 一共有