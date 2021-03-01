dat04<- as.data.frame(dat04)
idx<- which(duplicated(dat04[,1]))
for (i in idx) {
  dat04[,1][i] <- paste(dat04[,1][i],"-duplicate",sep = "")
  
}

a<- left_join(x = dat01,y = dat02,by = "编号")

b<- left_join(x = a, y = dat03,by = "编号")
c <- left_join(x = b, y = dat04,by = "编号")
d <- left_join(x = c, y = dat05,by = "编号")


select(samplenames,编号)

rgt <- readxl::read_excel(path = "C:\\Users\\Administrator\\Desktop\\10.9.xlsx")
rgt<- read.csv("C:\\Users\\Administrator\\Desktop\\bioimformatics\\2019南瓜GWAS分析数据\\mapping1.csv",header = F)

library(dplyr)
select(.data = rgt, "干重(g)")
