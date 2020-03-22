# NHL ELO Model Project
# Jack and Michael
# Date: Feb 21, 2020
# 1st draft code submission
#
#
#------Working Active Code---------------------

# The below lines of code sets our working directory to point at the NHL seasons.csv data
# This data imports all the datasets that we will be working with into RStudio

NHLwd <- getwd()
Seasons.Path <- paste(getwd(),"/","Seasons","/",sep ="")
setwd(paste(NHLwd, "/", "Seasons", "/", sep = ""))
nhl.seasons <- list.files(pattern="*.csv")
for (i in 1:length(nhl.seasons)) assign(nhl.seasons[i], read.csv(nhl.seasons[i], stringsAsFactors = FALSE))


# Creating a base elo function for individual matches
# This function is the basis of our model
# This function should be run approx 1200 times per season, 15000 times total
# We can adapt this model to streamline the process to hopefully reduce 
# computation time

elo.test <- function(TeamA, TeamB, k) {   # Team A and Team B values are their numeric ratings
                                          # k is the weight of calculation factor
  
  # This calculation is for the expected values for both teams
  EVA <- (1 / (1 + 10^((TeamB - TeamA)/400))) # This compares the ratings relative
  EVB <- (1 / (1 + 10^((TeamA - TeamB)/400))) # to the opposing team in order to
                                              # give a probability of winning
  
  # Calculating change in rating if win or lose for Team 1
  UpdateWinA  <- TeamA + k * (1 - EVA)
  UpdateLoseA  <- TeamA + k * (0 - EVA)
  
  # The same calculation as above for Team 2
  UpdateWinB <- TeamB + ((1-EVB)* k)
  UpdateLoseB <- TeamB + ((0-EVB)* k)
  
  # prob is the expected score column giving probabilities for winning
  # this creates a data frame of the expected values given as percentage
  prob <- (data.frame(prob=c(EVA,EVB)) * 100)
  # Win A shows the updated ratings should TeamA win
  WinA <- (data.frame(Win1=c(UpdateWinA,UpdateLoseB)))
  # Win B shows the updated ratings for both players should TeamB win
  WinB <- (data.frame(Win2=c(UpdateLoseA,UpdateWinB)))
  
  dattable <- cbind(prob,WinA,WinB)
  rownames(dattable) <- c('TeamA','TeamB')
  return(dattable)
}

# We can test our model; TeamA has 1200 rating, TeamB with 1000 rating and a k of 32
elo.test(1200,1000,32)


# We use unique function to determine the number of unique teams that played each season
# We store the team names in teams.char
# We then use teams.rating in a for loop to convert them all to a corresponding value of 1000
# The 1000 value is the initial rating we are giving all of the teams
teams.char <-(unique(NHL2018.csv$Home))  # Used the teams of the 2018 season
teams.char <- sort(teams.char)  # We want them to be ordered alphabetically
teams.rating <-(unique(NHL2018.csv$Home))
for(i in 1:length(teams.rating)){  # a for loop that applies a value of 1000 to
 teams.rating[i] = 1000            # the length(teams)
}                                  # loop is a bit unnecessary but it works

# We then bind the two vectors together - teams.char and teams.rating
# This gives us all 31 teams with a numeric value of 1000
teams.table <- cbind(teams.char, teams.rating)
teams.table <- as.data.frame(teams.table)

# Just a test that this works, this gives the rating of the team in the second row
teams.table[2,]




# We can write a function that will retrieve the rating for each team based on name
# This allows us to reference our tables.team data set by the character names given in our 2018.csv data
# Ex: getRating(NHL2018.csv[1,2]) will give us the rating of the 
# visiting team, the Calgary Flames
getRating <- function(team){
  get.rating <- teams.table$teams.rating
  names(get.rating) <- teams.table$teams.char
  teamrating <- (get.rating[team])
  teamrating <- as.numeric(levels(teamrating))[teamrating]  # Needed to make as numeric
  print(teamrating)                                         # elo.test no accept factors
}
# As a test, let us change the Calgary Flames to a value of 1001 rather than 1000
teams.rating[5] = 1001  # Calgary is the 5th team in our teams.table
teams.table <- cbind(teams.char, teams.rating)
teams.table <- as.data.frame(teams.table)

# Let us test our getRating function
getRating(NHL2018.csv[1,2]) # If we see on our NHL2018.csv dataset, the Calgary
                            # Flames are in row 1, column 2
# We see we get the expected result of 1001, which corresponds to the value we gave the Flames
getRating(NHL2018.csv[1,4]) # Running the test on NHL2018.csv[1,4] we see that
# the Edmonton Oilers still have their value of 1000
#
#
#
# I rewrote our elo.test function as elo.calculation to streamline our code
# In this instance, we dont ask for a percentage to be given for the victories of either team
# Instead this accesses the data assuming one team is already decided as the winner
# This will reduce the amount of computation required.
# This also made it easier to store result by winner/loser
#
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
  
  NewWinner.temp <<- as.numeric(NewWinnerRating)  # saves as a global variable
                                                 # to be used to store the ratings
  NewLoser.temp <<- as.numeric(NewLoserRating)    # in our teams.table
  return(dattable)                                # The .temps will be overwritten on each iteration
}

elo.calculation(1200,1000,32)


# WORK IN PROGRESS LOOP
# Now working on the model over the course of the 2018 season
# Trying to work using our getRating function and elo.calculation
# Also trying to get rid of the 1001, 1000 levels given by the below function
# If we just ask for the results - it works, but print(results) does not.
for(i in 1:1){
  results <- elo.calculation(getRating(NHL2018.csv[i,4]), getRating(NHL2018.csv[i,2]), 32)
  print(results)
}
# For whatever reason if we try the entire loop, it prints [1]1001, [1]1000
# But the function does serve its purpose
# Work in progress on applying it to the entire dataset
# The main issue I am having with it is that I am trying to pair the updating ratings
# with the appropriate team
# The pairing was easy to do from one side, using the getRatings function, 
# but much harder going the other direction













#------Unused or work in progress code-------------------

# Writing an apply new ratings function
new.ratings <- function(rating.winner, rating.loser){
  team.name <- teams.table$teams.char
  
}






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