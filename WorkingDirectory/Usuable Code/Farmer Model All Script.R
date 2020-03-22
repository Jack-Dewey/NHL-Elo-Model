# RESET THE TABLE
# The 1000 value is the initial rating we are giving all of the teams
teams.char <-(unique(NHL2018.csv$Home))  # Used the names of teams present in the 2018 season
teams.char <- sort(teams.char)  # We want them to be ordered alphabetically
teams.rating <-(unique(NHL2018.csv$Home))
for(i in 1:length(teams.rating)){  # a for loop that applies a value of 1000 to
  teams.rating[i] = 1000            # the length(teams)
}                                  # loop is a bit unnecessary but it works

# We then bind the two vectors together - teams.char and teams.rating
# This gives us all 31 teams with a numeric value of 1000
teams.char <- as.character(teams.char)
teams.table <- cbind(teams.char, teams.rating)
teams.table <- data.frame(teams.table, stringsAsFactors = F)
teams.table$teams.rating <- as.numeric(teams.table$teams.rating)
# Just a test that this works, this gives the rating of the team i



for (j in 1:nrow(NHL2006.csv)){
  total.elo.calculation(getRating(NHL2006.csv[j,10]),(getRating(NHL2006.csv[j,11])),32)
}

for (j in 1:nrow(NHL2007.csv)){
  total.elo.calculation(getRating(NHL2007.csv[j,10]),(getRating(NHL2007.csv[j,11])),32)
}


for (j in 1:nrow(NHL2008.csv)){
  total.elo.calculation(getRating(NHL2008.csv[j,10]),(getRating(NHL2008.csv[j,11])),32)
}

for (j in 1:nrow(NHL2009.csv)){
  total.elo.calculation(getRating(NHL2009.csv[j,10]),(getRating(NHL2009.csv[j,11])),32)
}

for (j in 1:nrow(NHL2010.csv)){
  total.elo.calculation(getRating(NHL2010.csv[j,10]),(getRating(NHL2010.csv[j,11])),32)
}

for (j in 1:nrow(NHL2011.csv)){
  total.elo.calculation(getRating(NHL2011.csv[j,10]),(getRating(NHL2011.csv[j,11])),32)
}

for (j in 1:nrow(NHL2012.csv)){
  total.elo.calculation(getRating(NHL2012.csv[j,10]),(getRating(NHL2012.csv[j,11])),32)
}

for (j in 1:nrow(NHL2013.csv)){
  total.elo.calculation(getRating(NHL2013.csv[j,10]),(getRating(NHL2013.csv[j,11])),32)
}

for (j in 1:nrow(NHL2014.csv)){
  total.elo.calculation(getRating(NHL2014.csv[j,10]),(getRating(NHL2014.csv[j,11])),32)
}

for (j in 1:nrow(NHL2015.csv)){
  total.elo.calculation(getRating(NHL2015.csv[j,10]),(getRating(NHL2015.csv[j,11])),32)
}

for (j in 1:nrow(NHL2016.csv)){
  total.elo.calculation(getRating(NHL2016.csv[j,10]),(getRating(NHL2016.csv[j,11])),32)
}

for (j in 1:nrow(NHL2017.csv)){
  total.elo.calculation(getRating(NHL2017.csv[j,10]),(getRating(NHL2017.csv[j,11])),32)
}

for (j in 1:nrow(NHL2018.csv)){
  total.elo.calculation(getRating(NHL2018.csv[j,10]),(getRating(NHL2018.csv[j,11])),32)
}

for (j in 1:nrow(NHL2019.csv)){
  total.elo.calculation(getRating(NHL2019.csv[j,10]),(getRating(NHL2019.csv[j,11])),32)
}
