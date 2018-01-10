# Load the dplyr package
library(dplyr)
library(countrycode)

# Import votes df - Can be found on Datacamp and probably UN website? 
votes <- readRDS('~/Desktop/votes.rds')

# Add a country column within the mutate: votes_processed and create year
votes_processed <- votes %>%
  filter(vote <= 3) %>%
  mutate(year = session + 1945,
         country = countrycode(ccode, "cown", "country.name"))

# Filter only for the 50's
Decade_50 <- votes_processed %>%
  filter(year <= 1960 & year > 1949)

# Get percentage of yes votes for the decade

Decade_50 %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

# Get percentage of yes votes by country in the 50's

Decade_50yes <- Decade_50 %>%
  group_by(country) %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

# Get counties who percentage yes votes were below 50%

Dec50wunder50per <- Decade_50yes %>%
  group_by(country) %>%
  filter(percent_yes < .5)

# Filter only for the 60's
Decade_60 <- votes_processed %>%
  filter(year > 1959 & year <= 1970)

# Get percentage of yes votes for the decade

Decade_60 %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

Decade_60per <- Decade_60 %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

# Get percentage of yes votes by country in the 50's

Decade_60yes <- Decade_60 %>%
  group_by(country) %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

# Get counties who percentage yes votes were below 50%

Dec60wunder60per <- Decade_60yes %>%
  group_by(country) %>%
  filter(percent_yes < .5)


# Filter only for the 70's
Decade_70 <- votes_processed %>%
  filter(year > 1969 & year < 1980)

# Get percentage of yes votes for the decade

Decade_70 %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

Decade_70per <- Decade_70 %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))
# Get percentage of yes votes by country in the 50's

Decade_70yes <- Decade_70 %>%
  group_by(country) %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

# Get counties who percentage yes votes were below 50%

Dec70wunder50per <- Decade_70yes %>%
  group_by(country) %>%
  filter(percent_yes < .5)



# Filter only for the 80's
Decade_80 <- votes_processed %>%
  filter(year > 1979 & year < 1990)

# Get percentage of yes votes for the decade

Decade_80 %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

Decade_80per <- Decade_80 %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))


# Get percentage of yes votes by country in the 50's

Decade_80yes <- Decade_80 %>%
  group_by(country) %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

# Get counties who percentage yes votes were below 50%

Dec80wunder50per <- Decade_80yes %>%
  group_by(country) %>%
  filter(percent_yes < .5)


# Filter only for the 90's
Decade_90 <- votes_processed %>%
  filter(year > 1989 & year < 2000)

# Get percentage of yes votes for the decade

Decade_90 %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

Decade_90per <- Decade_90 %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

# Get percentage of yes votes by country in the 50's

Decade_90yes <- Decade_90 %>%
  group_by(country) %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

# Get counties who percentage yes votes were below 50%

Dec90wunder50per <- Decade_90yes %>%
  group_by(country) %>%
  filter(percent_yes < .5)


# Filter only for the 2000's
Decade_2000 <- votes_processed %>%
  filter(year > 1999 & year < 2010)

# Get percentage of yes votes for the decade

Decade_2000 %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

Decade_2000per <- Decade_2000 %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

# Get percentage of yes votes by country in the 50's

Decade_2000yes <- Decade_2000 %>%
  group_by(country) %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

# Get counties who percentage yes votes were below 50%

Dec2000wunder50per <- Decade_2000yes %>%
  group_by(country) %>%
  filter(percent_yes < .5)


# Filter only for the 2010's
Decade_2010 <- votes_processed %>%
  filter(year > 2009 & year < 2020)

# Get percentage of yes votes for the decade

Decade_2010 %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

Decade_2010per <- 
  Decade_2010 %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))
# Get percentage of yes votes by country in the 50's

Decade_2010yes <- Decade_2010 %>%
  group_by(country) %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

# Get counties who percentage yes votes were below 50%

Dec2010wunder50per <- Decade_2010yes %>%
  group_by(country) %>%
  filter(percent_yes < .5)

# Get all data together

Dec50wunder50per
Dec60wunder60per
Dec70wunder50per
Dec80wunder50per
Dec90wunder50per
Dec2000wunder50per
Dec2010wunder50per

#Add column year
Dec50wunder50per$year<- "1950"
Dec60wunder60per$year<- "1960"
Dec70wunder50per$year<- "1970"
Dec80wunder50per$year<- "1980"
Dec90wunder50per$year<- "1990"
Dec2000wunder50per$year<- "2000"
Dec2010wunder50per$year<- "2010"

# Add column year

Decade_60per$year <- "1960"
Decade_70per$year <- "1970"
Decade_80per$year <- "1980"
Decade_90per$year  <- "1990"
Decade_2000per$year <- "2000"
Decade_2010per$year <- "2010"



# Now we put it all together 

Total_Decades <- rbind(Dec50wunder50per,
                       Dec60wunder60per,
                       Dec70wunder50per,
                       Dec80wunder50per,
                       Dec90wunder50per,
                       Dec2000wunder50per,
                       Dec2010wunder50per)

# Now we put it all together


Total_agreement <- rbind(Decade_60per,
                         Decade_70per,
                         Decade_80per,
                         Decade_90per,
                         Decade_2000per,
                         Decade_2010per)

Total_agreement$country <- "Consensus"

Total_agreement <- Total_agreement[,c("country","total","percent_yes","year")]

#How do we add consunsud to year? 


# Chart UN voting
ggplot(Total_agreement, aes(year, percent_yes)) +
  geom_point() + geom_smooth()

US <- Total_Decades %>%
  filter(country == 'United States of America')

library(ggplot2)

# Chart US voting
ggplot(US, aes(year, percent_yes, color = country)) +
  geom_point() + geom_smooth()

# Chart UN voting
ggplot(Total_Decades, aes(year, percent_yes, color = country)) +
  geom_point() + geom_smooth()

New_plot <- Total_Decades %>%
  filter(percent_yes < .3)

# Chart less than 30% voting
ggplot(New_plot, aes(year, percent_yes, color = country)) +
  geom_point() + geom_smooth()

New_plot35 <- Total_Decades %>%
  filter(percent_yes < .35)

# Chart less than 35% voting
ggplot(New_plot, aes(year, percent_yes, color = country)) +
  geom_point() + geom_smooth()

# Chart less than 40% voting
New_plot40 <- Total_Decades %>%
  filter(percent_yes < .4)

ggplot(New_plot40, aes(year, percent_yes, color = country)) +
  geom_point() + geom_smooth()

# Chart less than 38%% voting
New_plot38 <- Total_Decades %>%
  filter(percent_yes < .38)

New_plot40 <-replace(New_plot40,"Federal Republic of Germany ", "Germany")

a<-ggplot(New_plot40, aes(year, percent_yes, color = country, label = country))
a          
d<- ggplot(New_plot40, aes(year, percent_yes, color = country, label = country)) +
  geom_point() 
d
# Create new variable and then add geom text
p <- ggplot(data = New_plot40, aes(x=year, y=percent_yes, color = country, label = country))
#bp <- ggplot(data=PlantGrowth, aes(x=group, y=weight, fill=group)) 

p
p + guides(fill=FALSE)
bp <- p + geom_text(check_overlap = TRUE, size = 2) + guides(fill=FALSE)
bp + guides(fill = guide_legend(reverse=TRUE))



