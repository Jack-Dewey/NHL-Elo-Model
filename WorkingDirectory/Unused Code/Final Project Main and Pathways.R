#Name: Michael Lee and Jack Dewey
#Date: 19/02/20
#Title: Final Project Main and Pathways
#
#Description: This script contains all of our pathways and any main codes we
#require for our project
#
#Index :
# 1. Main Codes
# 2. Directory Creation
# 3. Pathways


#--------------------------------- 1. Main Codes -------------------------------

#We get our working directory here
NHLwd <- getwd()


#We set our wd as the Seasons folder
setwd(paste(NHLwd, "/", "Seasons", "/", sep = ""))

#Chooses which files to load - List of our csv files
nhl.seasons <- list.files(pattern="*.csv")

#Forloop to load the NHL seasons csv files 2006-2019
for (i in 1:length(nhl.seasons)) assign(nhl.seasons[i], 
                                        read.csv(nhl.seasons[i],
                                                 stringsAsFactors = F))

#We identify the different teams in the league
teams <- unique(NHL2006.csv$Home)

#--------------------------------- Mess around coding --------------------------

#We need to identify and standardize the team names of teams that play under
#different names currently.
PhoenixH <- which(NHL2015.csv$Home == "Phoenix Coyotes")
AnaheimH <- which(NHL2015.csv$Home == "Mighty Ducks of Anaheim")
AtlantaH <- which(NHL2015.csv$Home == "Atlanta Thrashers")
PhoenixV <- which(NHL2015.csv$Visitor == "Phoenix Coyotes")
AnaheimV <- which(NHL2015.csv$Visitor == "Mighty Ducks of Anaheim")
AtlantaV <- which(NHL2015.csv$Visitor == "Atlanta Thrashers")

#We change the names in the dataframe for home and away
NHL2015.csv$Home[PhoenixH] <- "Arizona Coyotes"
NHL2015.csv$Home[AnaheimH] <- "Anaheim Ducks"
NHL2015.csv$Home[AtlantaH] <- "Winnipeg Jets"
NHL2015.csv$Visitor[PhoenixV] <- "Arizona Coyotes"
NHL2015.csv$Visitor[AnaheimV] <- "Anaheim Ducks"
NHL2015.csv$Visitor[AtlantaV] <- "Winnipeg Jets"

#forloop to replace defunct teams

k  <- mget(nhl.seasons[1])
  
  
subset(TotalNHL.csv,
       )
TotalNHL.csv$Home == "Vancouver Canucks"



sort(unique(NHL2006.csv$Visitor),  )


TotalNHL.csv <- rbind(NHL2007.csv, 
                      NHL2008.csv,
                      NHL2009.csv,
                      NHL2010.csv,
                      NHL2011.csv, 
                      NHL2012.csv,
                      NHL2013Lockout.csv,
                      NHL2014.csv,
                      NHL2015.csv,
                      NHL2016.csv,
                      NHL2017.csv,
                      NHL2018.csv,
                      NHL2019.csv)

TotalNHLtable <- mget(nhl.seasons)

table(TotalNHLtable$NHL2006.csv)


  


#--------------------------------- 2. Directory Creation -----------------------

dir.create("Seasons")




#--------------------------------- 3. Pathways ---------------------------------

#Pathway to our seasons folder
Seasons.Path <- paste(NHLwd, "/", "Seasons", "/", sep = "")







#------- 