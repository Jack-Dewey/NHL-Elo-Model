eloRating <- function(home="HomeTeam", away="AwayTeam", homeGoals="FTHG",
                      awayGoals="FTAG", data, kfactor=24, initialRating=1500,
                      homeAdvantage=0){
  
  #Make a list to hold ratings for all teams
  all.teams <- levels(as.factor(union(levels(as.factor(data[[home]])),
                                      levels(as.factor(data[[away]])))))
  
  ratings <- as.list(rep(initialRating, times=length(all.teams)))
  names(ratings) <- all.teams
  
  #Loop trough data and update ratings
  for (idx in 1:dim(data)[1]){
    
    #get current ratings
    homeTeamName <- data[[home]][idx]
    awayTeamName <- data[[away]][idx]
    homeTeamRating <- as.numeric(ratings[homeTeamName]) + homeAdvantage
    awayTeamRating <- as.numeric(ratings[awayTeamName])
    
    #calculate expected outcome 
    expectedHome <- 1 / (1 + 10^((awayTeamRating - homeTeamRating)/400))
    expectedAway <- 1 - expectedHome
    
    #Observed outcome
    goalDiff <- data[[homeGoals]][idx] - data[[awayGoals]][idx]
    if (goalDiff == 0){
      resultHome <- 0.5
      resultAway <- 0.5
    }
    else if (goalDiff < 0){
      resultHome <- 0
      resultAway <- 1
    }
    else if (goalDiff > 0){
      resultHome <- 1
      resultAway <- 0
    }
    
    #update ratings
    ratings[homeTeamName] <- as.numeric(ratings[homeTeamName]) + kfactor*(resultHome - expectedHome)
    ratings[awayTeamName] <- as.numeric(ratings[awayTeamName]) + kfactor*(resultAway - expectedAway)
  }
  
  #prepare output
  ratingsOut <- as.numeric(ratings)
  names(ratingsOut) <- names(ratings)
  ratingsOut <- sort(ratingsOut, decreasing=TRUE)
  
  return(ratingsOut) 
}