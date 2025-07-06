# installing packages
library(rvest)
library(robotstxt)
library(dplyr)
library(stringr)


#scrapping website

url<-"https://www.shopclues.com/search?q=men+shoes&z=0&cid=1551&df[]=D3&df[]=D4&df[]=D2&fsrc=discount_percentage"

#allowability
path=paths_allowed(url)

#html of the website
web=read_html(url)
View(web)


#segregating shoe names
name_of_shoes<- web %>% html_nodes(".search_blocks h2") %>% html_text()
View(name_of_shoes)

#segregating offer price
offer_price<- web %>% html_nodes(".p_price") %>% html_text()
View(offer_price)


# segregating original price
original_price <- web %>% html_nodes(".old_prices span") %>% html_text()
View(original_price)

#segregating discount
discount<- web %>% html_nodes(".prd_discount") %>% html_text()
View(discount)

# creating data frame

shoes=data.frame(name_of_shoes,offer_price,original_price,discount)
View(shoes)

#converting into csv file
write.csv(shoes,"mens shoes under 2500")

# saving into file manager
file=read.csv("mens shoes under 2500")
View(file)
