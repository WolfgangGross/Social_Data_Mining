#make sildify presentaion out of the r scripts
#to install you need to get devtools not working on R 3.1.1
library(devtools)
#use devtools function install_github to install the repository slidify
install_github('ramnathv/slidify')
#load 
library(slidify)

#also requires knitr
install.packages('knitr')
library('knitr')
#create slides
author("Task_1")

#run and open sildes
slidify('index.Rmd')

#publish slides to github
publish_github(user='WolfgangGross',repro='Social_Data_Mining')