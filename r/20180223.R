library(devtools)
#devtools::install_github("cardiomoon/Kormaps")
library(foreign)
require(Kormaps)
require(tmap)



Encoding(names(korpopmap2))<-"UTF-8"
Encoding(areacode$code)<-"UTF-8"
areacode <- kormaps2014::changeCode(areacode)


#�Լ�

submap <- function(map,area){
  code<-area2code(area)
  if(length(code)>0) {
    code1=paste0("^",code)
    temp=Reduce(paste_or,code1)
    mydata<-map[grep(temp,map$code),]
  }
}


is.integer0 <- function(x) { is.integer(x) && length(x) == 0L}

paste_or <- function(...) {
  paste(...,sep="|")
}


area2code <- function(area){
  result<-c()
  for(i in 1:length(area)){
    pos<-grep(area[i],areacode[[2]])
    if(!is.integer0(pos)) temp<-areacode[pos,1]
    else {
      pos<-grep(area[i],areacode[[3]])
      if(!is.integer0(pos)) temp<-areacode[pos,1]
    }
    result=c(result,temp)
  }
  result
}




##�� ����������

getwd()
setwd('c:/easy_r')

road <- read.csv('���� ���δ�� �����հ�.csv', header = T)
road <- as.data.frame(road)
class(road$S)
road$S <- as.character(road$S)
road$S
road$S <- as.numeric(road$S)
road$S <- as.integer(road$S)
#road$N <- as.factor(road$N)
#road$code <- as.factor(road$code)
road$codecode <- as.integer(road$code)
#class(green$S)
#class(green$N)
#class(green$code)
#green


##

korpopmap5 <- korpopmap2
korpopmap5$codecode <- as.integer(korpopmap5$code1)
#korpopmap5$codecode
#class(korpopmap5$codecode)

#green������ �����ͳ־����

korpopmap5$����_�� <- ifelse(korpopmap5$codecode %in% road$codecode, road$S, NA)
table(is.na(korpopmap5$����_��))

Seoul2=submap(korpopmap5,"����")
qtm(Seoul2,"����_��")+tm_layout(fontfamily="AppleGothic")