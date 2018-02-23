plot.new()
dev.new()

x <- matrix(c(40,52,33,51),2,2)
x
barplot(x,main = '나를 중시하는 경향',beside = T, names = c('가족도 중요하지만 나를 먼저 생각한다','물건을 충동적으로 구매하는 경우가 많다'), col = c('pink','gray'),ylim = c(0,60), ylab = '(%)')

legend(3.5,59,c('2009년','2014년'),cex = 0.8,fill = c('pink','gray'))



x <- matrix(c(40,52,33,51),2,2)
x
barplot(x,main = '나를 중시하는 경향', names = c('가족도 중요하지만 나를 먼저 생각한다','물건을 충동적으로 구매하는 경우가 많다'), col = c('pink','gray'),ylim = c(0,100), ylab = '(%)')
