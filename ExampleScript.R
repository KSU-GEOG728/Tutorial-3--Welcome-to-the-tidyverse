


#Example with Census Data

library(tidyverse)

d<-read.csv("Demographics.csv", stringsAsFactors = FALSE)

head(d)

d2<- d  %>% mutate_at(., vars(QAGEDEP:QED12LES),  ~ (. * 100)) #convert to percent

  ggplot(data = d2) + geom_smooth(mapping = aes(x = QFEMLBR, y = QAGEDEP, color = as.factor(STATEFP)))
  
head(d2)

hist(d2$QAGEDEP)

d2<-mpg


fa_sub <- fa %>% 
  select(CensusTract:POP2010,TractLOWI:TractSNAP) 

head(fa_sub)

#convert raw population counts to % population
fa_sub2 <- fa_sub %>%
  mutate_at(., vars(TractLOWI:TractSNAP), ~ ./POP2010*100)

#get average percent by state for all % population variables

fa_sub3 <- fa_sub2 %>%
  group_by(State) %>%
  summarise_at(., vars(TractLOWI:TractSNAP), ~ mean(., na.rm=T))

ggplot(fa_sub2) + 
  geom_smooth( mapping=aes(x = TractHispanic, y = TractLOWI, color=State)) +
  theme(legend.position = "bottom")



