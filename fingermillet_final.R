a<-read.table(file = "clipboard", sep = "\t", header=TRUE)
a
attach(a)
str(a)
library(plyr)
library(plyr)
library(ggplot2)
library(Rmisc)
library(grid)
library(ggplot2)
library(ggExtra)
library(grid)
library(reshape2)
p<- ggplot(a, aes(x=trt, y=gy, fill=  trt)) + geom_boxplot()
n<-p+theme(axis.text.x = element_text(size = 10, vjust=0,hjust = 1,  angle = 90),strip.text = element_text(size=10, lineheight=0.0001))
g<-n+theme(axis.title.y=element_text(size=10))+stat_summary(fun=mean, geom="point", shape=20, size=2, color="black", fill="red")
d<-g+theme(legend.position="none")+labs(x="Treatment ", y="Grain yield (mt/ha)")
d

q <- ggplot(a, aes(x=trt, y=sy, fill=  trt)) + geom_boxplot()
r<-q+theme(axis.text.x = element_text(size = 10, vjust=0,hjust = 1,  angle = 90),strip.text = element_text(size=10, lineheight=0.0001))
s<-r+theme(axis.title.y=element_text(size=10))+stat_summary(fun=mean, geom="point", shape=20, size=2, color="black", fill="red")
t<-s+theme(legend.position="none")+labs(x="Treatment ", y="Straw yield (mt/ha)")
t

u <- ggplot(a, aes(x=trt, y=SPAD  , fill=  trt)) + geom_boxplot()
v<-u+theme(axis.text.x = element_text(size = 10, vjust=0,hjust = 1,  angle = 90),strip.text = element_text(size=10, lineheight=0.0001))
w<-v+theme(axis.title.y=element_text(size=10))+stat_summary(fun=mean, geom="point", shape=20, size=2, color="black", fill="red")
x<-w+theme(legend.position="none")+labs(x="Treatment ", y="SPAD reading")
x

k <- ggplot(a, aes(x=trt, y=finger  , fill=  trt)) + geom_boxplot()
l<-k+theme(axis.text.x = element_text(size = 10, vjust=0,hjust = 1,  angle = 90),strip.text = element_text(size=10, lineheight=0.0001))
m<-l+theme(axis.title.y=element_text(size=10))+stat_summary(fun=mean, geom="point", shape=20, size=2, color="black", fill="red")
o<-m+theme(legend.position="none")+labs(x="Treatment ", y="Finger per plant")
o


library(gridExtra)

red<-grid.arrange(d,t, o, x, ncol=4)
red


library(RDCOMClient)
library(R2PPT)
#devtools::install_github("dkyleward/RDCOMClient")
temp_file<-paste(tempfile(),".wmf", sep="")
ggsave(temp_file, plot=red)

mkppt <- PPT.Init(method="RDCOMClient")
mkppt<-PPT.AddBlankSlide(mkppt)
mkppt<-PPT.AddGraphicstoSlide(mkppt, file=temp_file)
unlink(temp_file)
