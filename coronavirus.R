library(coronavirus)
library(dplyr)
library(ggplot2)

data("coronavirus")

coronavirus

summary(coronavirus)

names(coronavirus)

str(coronavirus)

nrow(coronavirus)

ncol(coronavirus)

  coronavirus %>%
  filter(type == "death", Country.Region == "Mainland China") %>%
  group_by(Country.Region) %>%
  summarise(total = sum(cases)) %>%
  arrange(-total) %>%
  head(20)

ggplot(coronavirus, aes(y=coronavirus$Province.State, x= coronavirus$cases)) + 
geom_point(aes(col=coronavirus$Province.State, size = coronavirus$cases)) + theme_minimal()

ggplot(coronavirus, aes(x=cases, y=Country.Region)) + 
  geom_point(aes(col=Country.Region, size=cases)) +
  labs(subtitle="Cases Vs Country Region", 
       y="Country Region", 
       x="Cases", 
       title="Scatterplot", 
       caption = "Source: World Health Organization")


# Get the number of recovered cases in Mainland China by province
  coronavirus %>%
  filter(type == "recovered", Country.Region == "Mainland China") %>%
  group_by(Province.State) %>%
  summarise(total = sum(cases)) %>%
  arrange(-total)


# pre-set the bw theme.
theme_set(theme_classic())  
ggplot(coronavirus, aes(cases, Country.Region))+
geom_jitter(width = .5, size=1) +
  labs(subtitle="Recovered Vs Country Region", 
       y="Country Region", 
       x="cases", 
       title="")



ggplot(coronavirus, aes(x=Province.State, y=cases, label=cases)) + 
geom_bar(stat='identity', aes(fill=type), width=1)  +
  scale_fill_manual(name="Cases", 
                    labels = c("Confirmed","Death","Recovered"), 
                    values = c("confirmed"="blue", "recovered" = "green","death"="red")) + 
  labs(subtitle="Cases of COVID-19", 
       title= "") + 
  coord_flip()



theme_set(theme_bw())



ggplot(coronavirus, aes(x=type), filter(type == "death", coronavirus$Province.State == "Zhejiang"),group_by(coronavirus$Province.State)) + geom_bar(aes(fill = type)) + labs(title="Cases of COVID 19")


ggplot(data = coronavirus, 
       mapping = aes(x = coronavirus$cases, y = coronavirus$Country.Region, color = coronavirus$type)) +geom_line() 
