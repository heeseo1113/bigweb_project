library(devtools)
#devtools::install_github("cardiomoon/Kormaps")
library(foreign)
require(Kormaps)
require(tmap)



Encoding(names(korpopmap2))<-"UTF-8"
Encoding(areacode$code)<-"UTF-8"
areacode <- kormaps2014::changeCode(areacode)


#함수

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




##쓸 데이터파일

getwd()
setwd('c:/easy_r')


library(readxl)
air <- read_excel('air3.xls', col_names=TRUE)
class(air)
air <- as.data.frame(air)
air$E
class(air$E)
air$E<-air$E * 1000
class(air$E)
#as.integer(air$E)
#class(air$E)

air$E <- as.integer(air$E)



#levels(air$S) <- as.integer(air$S)
#air$S

#air$S <- ifelse(air$S %in% air$codecode, air$S, NA)


air$E
#air$S <- as.numeric(air$S)
air$E <- as.integer(air$E)
#air$N <- as.factor(air$N)
#air$code <- as.factor(air$code)
air$codecode <- as.integer(air$code)
class(air$E)
class(air$code)
#class(green$N)
class(air$codecode)
#green


##

korpopmap5 <- korpopmap2
korpopmap5$codecode <- as.integer(korpopmap5$code1)
#korpopmap5$codecode
#class(korpopmap5$codecode)

#green변수에 데이터넣어야함

korpopmap5$남자_명 <- ifelse(korpopmap5$codecode %in% air$codecode, air$E, NA)
table(is.na(korpopmap5$남자_명))
korpopmap5$남자_명


Seoul2=submap(korpopmap5,"서울")
qtm(Seoul2,"남자_명")