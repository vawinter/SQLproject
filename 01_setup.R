
# # Install package
# install.packages("RODBC")
# 
# library(RODBC)
# 
# Set up driver info and database path
DRIVERINFO <- "Driver={Microsoft Access Driver (*.accdb)};"
MDBPATH <- "ERMNSQL"
PATH <- paste0(DRIVERINFO, "DBQ=", MDBPATH)

con <- odbcConnect(PATH)

##Read in tables from Access database
db <- file.path("ERMN_Fish_20221101.accdb")
ch <- odbcDriverConnect(db)

#call library
library(RODBC)
#establish connection to Microsoft driver that you created
con <- odbcConnect("ERMNSQL")

#view all tables
sqlTables(con, tableType = "TABLE")$TABLE_NAME

# Set up driver info and database path
con <- odbcConnect("programSQL")

#view column names in a table
sqlColumns(con, "tbl_Events")$COLUMN_NAME
sqlColumns(con, "tbl_Sites")$COLUMN_NAME
sqlColumns(con, "tbl_Fish")$COLUMN_NAME
sqlColumns(con, "tbl_Fish_Count")$COLUMN_NAME
sqlColumns(con, "tbl_Habitat_Transect_Fields")$COLUMN_NAME
sqlColumns(con, "tbl_Habitat_Transect")$COLUMN_NAME
sqlColumns(con, "tbl_Habitat")$COLUMN_NAME

#tlu tables have metadata

