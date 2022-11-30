
## Install package
#install.packages("RODBC")

library(RODBC)

# Set up driver info and database path
con <- odbcConnect("programSQL")

