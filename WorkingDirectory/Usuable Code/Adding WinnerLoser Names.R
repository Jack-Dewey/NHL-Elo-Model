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


for(i in 1:dim(NHL2007.csv)){
  if(NHL2007.csv$G[i] > NHL2007.csv$G.1[i]){
    NHL2007.csv$Winner[i] <- NHL2007.csv$Visitor[i]
    NHL2007.csv$Loser[i] <- NHL2007.csv$Home[i]
  }
  else if(NHL2007.csv$G.1[i] > NHL2007.csv$G[i]){
    NHL2007.csv$Winner[i] <- NHL2007.csv$Home[i]
    NHL2007.csv$Loser[i] <- NHL2007.csv$Visitor[i]
  }
}


for(i in 1:dim(NHL2008.csv)){
  if(NHL2008.csv$G[i] > NHL2008.csv$G.1[i]){
    NHL2008.csv$Winner[i] <- NHL2008.csv$Visitor[i]
    NHL2008.csv$Loser[i] <- NHL2008.csv$Home[i]
  }
  else if(NHL2008.csv$G.1[i] > NHL2008.csv$G[i]){
    NHL2008.csv$Winner[i] <- NHL2008.csv$Home[i]
    NHL2008.csv$Loser[i] <- NHL2008.csv$Visitor[i]
  }
}

for(i in 1:dim(NHL2009.csv)){
  if(NHL2009.csv$G[i] > NHL2009.csv$G.1[i]){
    NHL2009.csv$Winner[i] <- NHL2009.csv$Visitor[i]
    NHL2009.csv$Loser[i] <- NHL2009.csv$Home[i]
  }
  else if(NHL2009.csv$G.1[i] > NHL2009.csv$G[i]){
    NHL2009.csv$Winner[i] <- NHL2009.csv$Home[i]
    NHL2009.csv$Loser[i] <- NHL2009.csv$Visitor[i]
  }
}
 
for(i in 1:dim(NHL2010.csv)){
  if(NHL2010.csv$G[i] > NHL2010.csv$G.1[i]){
    NHL2010.csv$Winner[i] <- NHL2010.csv$Visitor[i]
    NHL2010.csv$Loser[i] <- NHL2010.csv$Home[i]
  }
  else if(NHL2010.csv$G.1[i] > NHL2010.csv$G[i]){
    NHL2010.csv$Winner[i] <- NHL2010.csv$Home[i]
    NHL2010.csv$Loser[i] <- NHL2010.csv$Visitor[i]
  }
}

for(i in 1:dim(NHL2011.csv)){
  if(NHL2011.csv$G[i] > NHL2011.csv$G.1[i]){
    NHL2011.csv$Winner[i] <- NHL2011.csv$Visitor[i]
    NHL2011.csv$Loser[i] <- NHL2011.csv$Home[i]
  }
  else if(NHL2011.csv$G.1[i] > NHL2011.csv$G[i]){
    NHL2011.csv$Winner[i] <- NHL2011.csv$Home[i]
    NHL2011.csv$Loser[i] <- NHL2011.csv$Visitor[i]
  }
}

for(i in 1:dim(NHL2012.csv)){
  if(NHL2012.csv$G[i] > NHL2012.csv$G.1[i]){
    NHL2012.csv$Winner[i] <- NHL2012.csv$Visitor[i]
    NHL2012.csv$Loser[i] <- NHL2012.csv$Home[i]
  }
  else if(NHL2012.csv$G.1[i] > NHL2012.csv$G[i]){
    NHL2012.csv$Winner[i] <- NHL2012.csv$Home[i]
    NHL2012.csv$Loser[i] <- NHL2012.csv$Visitor[i]
  }
}

for(i in 1:dim(NHL2013.csv)){
  if(NHL2013.csv$G[i] > NHL2013.csv$G.1[i]){
    NHL2013.csv$Winner[i] <- NHL2013.csv$Visitor[i]
    NHL2013.csv$Loser[i] <- NHL2013.csv$Home[i]
  }
  else if(NHL2013.csv$G.1[i] > NHL2013.csv$G[i]){
    NHL2013.csv$Winner[i] <- NHL2013.csv$Home[i]
    NHL2013.csv$Loser[i] <- NHL2013.csv$Visitor[i]
  }
}

for(i in 1:dim(NHL2014.csv)){
  if(NHL2014.csv$G[i] > NHL2014.csv$G.1[i]){
    NHL2014.csv$Winner[i] <- NHL2014.csv$Visitor[i]
    NHL2014.csv$Loser[i] <- NHL2014.csv$Home[i]
  }
  else if(NHL2014.csv$G.1[i] > NHL2014.csv$G[i]){
    NHL2014.csv$Winner[i] <- NHL2014.csv$Home[i]
    NHL2014.csv$Loser[i] <- NHL2014.csv$Visitor[i]
  }
}

for(i in 1:dim(NHL2015.csv)){
  if(NHL2015.csv$G[i] > NHL2015.csv$G.1[i]){
    NHL2015.csv$Winner[i] <- NHL2015.csv$Visitor[i]
    NHL2015.csv$Loser[i] <- NHL2015.csv$Home[i]
  }
  else if(NHL2015.csv$G.1[i] > NHL2015.csv$G[i]){
    NHL2015.csv$Winner[i] <- NHL2015.csv$Home[i]
    NHL2015.csv$Loser[i] <- NHL2015.csv$Visitor[i]
  }
}


for(i in 1:dim(NHL2016.csv)){
  if(NHL2016.csv$G[i] > NHL2016.csv$G.1[i]){
    NHL2016.csv$Winner[i] <- NHL2016.csv$Visitor[i]
    NHL2016.csv$Loser[i] <- NHL2016.csv$Home[i]
  }
  else if(NHL2016.csv$G.1[i] > NHL2016.csv$G[i]){
    NHL2016.csv$Winner[i] <- NHL2016.csv$Home[i]
    NHL2016.csv$Loser[i] <- NHL2016.csv$Visitor[i]
  }
}

for(i in 1:dim(NHL2017.csv)){
  if(NHL2017.csv$G[i] > NHL2017.csv$G.1[i]){
    NHL2017.csv$Winner[i] <- NHL2017.csv$Visitor[i]
    NHL2017.csv$Loser[i] <- NHL2017.csv$Home[i]
  }
  else if(NHL2017.csv$G.1[i] > NHL2017.csv$G[i]){
    NHL2017.csv$Winner[i] <- NHL2017.csv$Home[i]
    NHL2017.csv$Loser[i] <- NHL2017.csv$Visitor[i]
  }
}



for(i in 1:dim(NHL2018.csv)){
  if(NHL2018.csv$G[i] > NHL2018.csv$G.1[i]){
    NHL2018.csv$Winner[i] <- NHL2018.csv$Visitor[i]
    NHL2018.csv$Loser[i] <- NHL2018.csv$Home[i]
  }
  else if(NHL2018.csv$G.1[i] > NHL2018.csv$G[i]){
    NHL2018.csv$Winner[i] <- NHL2018.csv$Home[i]
    NHL2018.csv$Loser[i] <- NHL2018.csv$Visitor[i]
  }
}


for(i in 1:dim(NHL2019.csv)){
  if(NHL2019.csv$G[i] > NHL2019.csv$G.1[i]){
    NHL2019.csv$Winner[i] <- NHL2019.csv$Visitor[i]
    NHL2019.csv$Loser[i] <- NHL2019.csv$Home[i]
  }
  else if(NHL2019.csv$G.1[i] > NHL2019.csv$G[i]){
    NHL2019.csv$Winner[i] <- NHL2019.csv$Home[i]
    NHL2019.csv$Loser[i] <- NHL2019.csv$Visitor[i]
  }
}

