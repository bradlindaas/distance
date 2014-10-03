library(ggmap)

GAzip <- as.character(c("30328"))
ILzip <- as.character(c("60018"))

results <- data.frame(
      syw = character()
    , state = factor()
    , startZip = character()
    , endZip = character()
    , miles = numeric()
    , hours = numeric()
    , stringsAsFactors=FALSE
)

readData <- function(file) {
    df <- read.csv (
        file 
        ,colClasses = c("character", "character")
        ,na.strings = "NA"
    )
    return(df)
}

GAdata <- readData("GAdata.csv")
ILdata <- readData("ILdata.csv")


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
    results <- rbind(results, newRow)
}

for (i in 1:nrow(GAdata)) {
    row <- GAdata[i,]
    gdata <- mapdist(row$zip, GAzip, mode = 'driving')
    newRow <- data.frame (
        syw = row$syw
        , state = as.factor(c("GA"))
        , startZip = row$zip
        , endZip = GAzip
        , miles = gdata$miles
        , hours = gdata$hours        
    )
    results <- rbind(results, newRow)
}


