
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(dplyr)

##paste data loading code here
##can also paste it into global.R if you want
##ui.R to also be able to access it (can be useful for column names
##in select boxes, etc.)

shinyServer(function(input, output) {
  
  #laceData is a "reactive" version of laceScores that we can filter
  #ignore this for tasks 0-2
  laceData <- reactive({
    out <- laceScores %>% 
      filter(L <= 10)
    return(out)
  })
  
  output$lacePlot <- renderPlot({
    #paste plotting code here
  })

})
