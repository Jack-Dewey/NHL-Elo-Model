NHLwd <- getwd()
Seasons.Path <- paste(getwd(),"/","Seasons","/",sep ="")
setwd(paste(NHLwd, "/", "Seasons", "/", sep = ""))
nhl.seasons <- list.files(pattern="*.csv")
for (i in 1:length(nhl.seasons)) assign(nhl.seasons[i], read.csv(nhl.seasons[i], stringsAsFactors = FALSE))


# Creating a base elo function for individual matches. 
# This function should be run approx 1200 times per season


elo.test <- function(Team1, Team2, k=32) {
  
  # Expected score for player A and for player B.
  EV1 <- (1 / (1 + 10^((Team2 - Team1)/400)))
  EV2 <- (1 / (1 + 10^((Team1 - Team2)/400)))
  
  # Calculating change in rating if win or lose
  UpdateWin1  <- Team1 + k * (1 - EV1)
  UpdateLose1  <- Team1 + k * (0 - EV1)
  
  # Do the same for team2
  UpdateWin2 <- Team2 + ((1-EV1)* k)
  UpdateLose2 <- Team2 + ((0-EV1)* k)
  
  # prob is the expected score column giving probabilities for winning
  prob <- (data.frame(prob=c(EV1,EV2)) * 100)
  # Win 1 shows the updated ratings should Team1 win
  Win1 <- (data.frame(Win1=c(UpdateWin1,UpdateLose2)))
  # Likewise for team 2
  Win2 <- (data.frame(Win2=c(UpdateLose1,UpdateWin2)))
  
  dattable <- cbind(prob,Win1,Win2)
  rownames(dattable) <- c('Team1','Team2')
  return(dattable)
}

elo.test(1200,1000,5)


unique(NHL2006.csv$Home)



teams <-(unique(NHL2006.csv$Home))
teams
team.objects <- mget(NHL2006.csv$Home)
?mget
saveRDS(teamssave, "NHL2006.csv")
save()
?saveRDS
list(teams)
teams.char <- as.character(teams)
binded.teams <- mget(teams.char)



for(i in length(teams)){
  
}
  
