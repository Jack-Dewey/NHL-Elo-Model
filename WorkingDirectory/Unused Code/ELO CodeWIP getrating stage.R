NHLwd <- getwd()
Seasons.Path <- paste(getwd(),"/","Seasons","/",sep ="")
setwd(paste(NHLwd, "/", "Seasons", "/", sep = ""))
nhl.seasons <- list.files(pattern="*.csv")
for (i in 1:length(nhl.seasons)) assign(nhl.seasons[i], read.csv(nhl.seasons[i], stringsAsFactors = FALSE))


# Creating a base elo function for individual matches. 
# This function should be run approx 1200 times per season


elo.test <- function(Team1, Team2, k) {
  
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
# We can test our model if Team1 has 1200 rating, Team2 with 1000 rating and a k of 32

elo.test(1200,1100,32)

# We use unique function to determine the unique teams that played each season
# We store the team names in teams.char
# We then use teams.rating in a for loop to convert them all to a corresponding value of 1000
# The 1000 value is the initial rating we are giving all of the teams
teams.char <-(unique(NHL2018.csv$Home))
teams.char <- sort(teams.char)  # We want them to be ordered alphabetically
teams.rating <-(unique(NHL2018.csv$Home))
for(i in 1:length(teams.rating)){
 teams.rating[i] = 1000
}
# We then bind the two vectors together
# This gives us all 31 teams with a numeric value of 1000
teams.table <- cbind(teams.char, teams.rating)
teams.table <- as.data.frame(teams.table)
teams.table[2,] # Just a test that this works




# We can write a function that will retrieve the rating for each team based on name
# This allows us to refer to our data set by row and colummn
# Ex: getRating(NHL2018.csv[1,2]) will give us the rating of the 
# visiting team, the Calgary Flames
getRating <- function(team){
  get.rating <- teams.table$teams.rating
  names(get.rating) <- teams.table$teams.char
  teamrating <- unname(get.rating[team])
  teamrating <- as.numeric(levels(teamrating))[teamrating]  # Needed to make as numeric
  print(teamrating)                                         # elo.test no accept factors
}
getRating(NHL2018.csv[1,2])



# Now working on the model over the course of the 2018 season

for(i in 1:1){
  results <- elo.test(getRating(NHL2018.csv[i,4]), getRating(NHL2018.csv[i,2]), 32)
  print(results)
}


elo.test(getRating(NHL2018.csv[i,4]), getRating(NHL2018.csv[i,2]), 32)


# Rewriting the elo calculation to be by winner vs loser
elo.calculation <- function(Winner, Loser, k) {
  
  # Expected score for player A and for player B.
  EVWinner <- (1 / (1 + 10^((Loser - Winner)/400)))
  EVLoser <- (1 / (1 + 10^((Winner - Loser)/400)))
  
  # Calculating change in rating if win or lose
  UpdatedWinner <- Winner + k * (1 - EVWinner)
  
  # Do the same for team2
  UpdatedLoser<- Loser + ((0-EVLoser)* k)
  
  # prob is the expected score column giving probabilities for winning
  prob <- (data.frame(prob=c(EVWinner,EVLoser)) * 100)
  # Win 1 shows the updated ratings should Team1 win
  NewWinnerRating <- (data.frame(WinnerRating=c(UpdatedWinner)))
  # Likewise for team 2
  NewLoserRating <- (data.frame(LoserRating=c(UpdatedLoser)))
  
  dattable <- cbind(NewWinnerRating,NewLoserRating)
  rownames(dattable) <- c('Updated Ratings')
  print(NewWinnerRating)
  NewWinner.temp <<- as.numeric(NewWinnerRating)
  print(NewLoserRating)
  NewLoser.temp <<- as.numeric(NewLoserRating)
  return(dattable)
}

elo.calculation(1200,1000,32)








for(i in 1:nrow(NHL2018.csv)){
  
}














# This assigns names to the values so we can call on names to get their corresponding value
# The get.rating call will get the name and value
# The unname function makes it so we only get their numeric value
get.rating <- teams.table$teams.rating
names(get.rating) <- teams.table$teams.char
get.rating['Arizona Coyotes']
unname(get.rating['Arizona Coyotes'])






testing
testing$NHL2006.csv[testing$NHL2006.csv == "Mighty Ducks of Anaheim"] <- "Anaheim Ducks"
testing <- mget(nhl.seasons[1])

for(i in 1:length(nhl.seasons)){
  temp.season <- mget(nhl.seasons[i])
  temp.season[temp.season == "Atlanta Thrashers"] <- "Winnipeg Jets"
  print(temp.season[1])
}

temp.season <-mget(nhl.seasons)
temp.season$NHL2006.csv$