setwd("D:/Edukacja/1.Doktorat/MIKROEKONOMETRIA/database.sqlite")
# ZMIENIECIE wd pod siebie. 
#Musi tam by� plik z baz� sqlite wtedy dziala wszystko


#Wczytanie Bazy SQLIte#####


library(RSQLite)
# Create an ephemeral RSQLite database
con <- dbConnect(RSQLite::SQLite(), dbname="database.sqlite")

dbListTables(con)

## list all tables
tables <- dbListTables(con)

## exclude sqlite_sequence (contains table information)
tables <- tables[tables != "sqlite_sequence"]

lDataFrames <- vector("list", length=length(tables))

## create a data.frame for each table
for (i in seq(along=tables)) {
  lDataFrames[[i]] <- dbGetQuery(conn=con, statement=paste("SELECT * FROM '", tables[[i]], "'", sep=""))
}

names(lDataFrames)<-tables

lDataFrames$Match

#Tutaj bardzo luzne sprawdzanie mozecie usuna�

unique(lDataFrames[["Match"]]["shoton"])
hist(lDataFrames[["Match"]]["shoton"])

summary(lDataFrames[["Match"]]["home_player_3"])
summary(lDataFrames[["Match"]]["shoton"])

lDataFrames$Match[lDataFrames[["Match"]]["id"]==1000,]

