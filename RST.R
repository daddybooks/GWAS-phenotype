dat<- read.csv(file = "tmp.csv", header = F)
samplenames<- as.character(samplenames[grep("[Q]",samplenames)])

idx<- seq(3,by= 6, length.out = 47)
peakno1 <- dat[,4]
peakno1<- as.character(peak)[idx]

idx<- seq(4,by= 6, length.out = 47)
peakno2 <- dat[,4]
peakno2<- as.character(peak)[idx]

idx<- seq(5,by= 6, length.out = 47)
peakno3 <- dat[,4]
peakno3<- as.character(peak)[idx]

idx<- seq(6,by= 6, length.out = 47)
peakno4 <- dat[,4]
peakno4<- as.character(peak)[idx]

dat<- data.frame(peakno1, peakno2, peakno3, peakno4, row.names = samplenames)