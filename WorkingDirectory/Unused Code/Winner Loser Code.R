#for loop that adds a column of winners and losers  




for(i in 1:dim(NHL2006.csv)){
  if(NHL2006.csv$G[i] > NHL2006.csv$G.1[i]){
    NHL2006.csv$Winner[i] <- NHL2006.csv$Visitor[i]
    NHL2006.csv$Loser[i] <- NHL2006.csv$Home[i]
  }
  else if(NHL2006.csv$G.1[i] > NHL2006.csv$G[i]){
    NHL2006.csv$Winner[i] <- NHL2006.csv$Home[i]
    NHL2006.csv$Loser[i] <- NHL2006.csv$Visitor[i]
  }
}




k <- function(teamdataframe){
  for(i in 1:dim(teamdataframe)){
    if(teamdataframe[i,3] > teamdataframe[i,5]){
      teamdataframe$Winner[i] <- teamdataframe[i,2]
      teamdataframe$Loser[i] <- teamdataframe[i,4]
    }
    else if(teamdataframe[i,5] > teamdataframe[i,3]){
      teamdataframe$Winner[i] <- teamdataframe[i,4]
      teamdataframe$Loser[i] <- teamdataframe[i,2]
    }
  }
}




