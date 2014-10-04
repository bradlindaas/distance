library(dplyr)
library(tidyr)
library(data.table)

n241 <- read.csv("nsegment241.txt",colClasses = c("character"), header=FALSE)
n242 <- read.csv("nsegment242.txt",colClasses = c("character"), header=FALSE)
n243 <- read.csv("nsegment243.txt",colClasses = c("character"), header=FALSE)

ATL <- read.csv("nsegment1564.txt",colClasses = c("character"), header=FALSE)
CHI <- read.csv("nsegment1625.txt",colClasses = c("character"), header=FALSE)

byAge <- rbind(n241, n242, n243)

dtAge <- data.table(byAge, key="V1")
dtATL <- data.table(ATL, key="V1")
dtCHI <- data.table(CHI, key="V1")

newATL <- merge(dtATL, dtAge)
newCHI <- merge(dtCHI, dtAge)

write.csv(newATL, "newATL.csv")
write.csv(newCHI, "newCHI.csv")
