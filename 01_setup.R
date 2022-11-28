

# Install package
install.packages("RODBC")

library(RODBC)

# Set up driver info and database path
DRIVERINFO <- "Driver={Microsoft Access Driver (*.accdb)};"
MDBPATH <- "ERMN_Fish_20221101.accdb"
PATH <- paste0(DRIVERINFO, "DBQ=", MDBPATH)

##Read in tables from Access database 
db <- file.path("ERMN_Fish_20221101.accdb")
ch <- odbcDriverConnect(db)
