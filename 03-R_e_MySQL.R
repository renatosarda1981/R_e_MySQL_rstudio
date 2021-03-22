install.packages('RMySQL')
install.packages('ggplot2')
install.packages('dbplyr')
library(RMySQL)
library(ggplot2)
library(dplyr)

con = dbConnect(MySQL(), user = 'root', password = 'dsa1234', dbname = 'titanicdb', host = 'localhost')

qry <- 'select pclass, survived, avg(age) as media_idade from titanic where survived = 1 group by pclass, survived;'

dbGetQuery(con, qry)

dados <- dbGetQuery(con, qry)
head(dados)
class(dados)
ggplot(dados, aes(pclass, media_idade)) + geom_bar(stat = 'identity')

