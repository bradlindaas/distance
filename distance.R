library(ggmap)

GAzip <- as.character(c("12345"))
ILzip <- as.character(c("60018"))

results <- data.frame(
      syw = character()
    , state = factor()
    , startZip = character()
    , endZip = character()
    , miles = numeric()
    , hours = numeric()
)

readData <- function(file) {
    df <- read.csv (
        file 
        ,colClasses = c("character", "character")
        ,na.strings = "NA"
    )
    return(df)
}

GAdata <- readData("GAlist.csv")
ILdata <- readData("GAlist.csv")

ILdata <- data.frame(syw = as.character("555555"), zip = as.character("60097"))

for (i in 1:nrow(ILdata)) {
    row <- ILdata[i,]
    gdata <- mapdist(row$zip, ILzip, mode = 'driving')
    newRow <- data.frame (
        syw = row$syw
        , state = as.factor(c("IL"))
        , startZip = row$zip
        , endZip = ILzip
        , miles = gdata$miles
        , hours = gdata$hours        
    )
}



