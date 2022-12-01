
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


#view column names in a table
sqlColumns(con, "tbl_Events")$COLUMN_NAME
sqlColumns(con, "tbl_Sites")$COLUMN_NAME
sqlColumns(con, "tbl_Fish")$COLUMN_NAME
sqlColumns(con, "tbl_Fish_Count")$COLUMN_NAME
sqlColumns(con, "tbl_Habitat_Transect_Fields")$COLUMN_NAME
sqlColumns(con, "tbl_Habitat_Transect")$COLUMN_NAME
habitat <- sqlColumns(con, "tbl_Habitat")

#tlu tables have metadata

WQqry <-  "SELECT Event_ID, Site_ID, Start_Date, Visit_Number, WQ_Time, Temp_C,
        SpecficConductance, DO_mgl, DO_Percent, pH, WaterColor, Secchi_Depth_cm 
        FROM  tbl_Events"

SiteWQ <- sqlQuery(con, WQqry)

nameqry <- "SELECT Site_ID, Site_Name From tbl_Sites"
SiteNames <- sqlQuery(con, nameqry)

site_WQ <- merge(SiteNames, SiteWQ, by="Site_ID")

#GROUP BY Trial
#must rename column names, otherwise event number will be column name
pHqry <- "SELECT Site_ID, avg(pH) AS Average_pH, max(pH) AS Max_pH, min(pH) AS Min_pH  
      FROM tbl_EVENTS
      GROUP BY Site_ID"
pHWQ <- sqlQuery(con, pHqry)

