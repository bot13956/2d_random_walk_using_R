#code to simulate random walk in 2 dimensions

#created on 9/2/2018

#@ Benjamin Tayo

library(tidyverse)

#total number of steps
N<-100000

#initialize x and y vectors to zero
x<-rep(0,times=N)
y<-rep(0,times=N)

#Perform random steps: right, left, up or down
for (i in 2:N){
  val<-sample(1:4,1,replace=TRUE)
  if(val==1){
    x[i]=x[i-1]+1
    y[i]=y[i-1]
    }
  else {
    if(val==2){
    x[i]=x[i-1]-1
    y[i]=y[i-1]
    }
    else {
      if(val==3){
      x[i]=x[i-1]
      y[i]=y[i-1]+1
      }
      else {
        if(val==4){
        x[i]=x[i-1]
        y[i]=y[i-1]-1
        }
      }
    }
  }
}

#create a data frame containing (x,y) coordinates and magnitude of displacement vector
rw<-data.frame(x=x,y=y,d=sqrt(x^2+y^2))

#generate visualization
rw%>%ggplot(aes(x,y))+geom_point(alpha=0.5)+
  ggtitle("2d random walk: N = 100,000")+
  xlab('x')+ ylab('y')+
  theme(plot.title = element_text(color="black", size=12, hjust=0.5, face="bold"),
        axis.title.x = element_text(color="black", size=12, face="bold"),
        axis.title.y = element_text(color="black", size=12, face="bold"))
    



