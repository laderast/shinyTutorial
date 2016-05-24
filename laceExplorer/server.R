
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
  #ignore this for tasks
  laceData <- reactive({
    filterValue <- as.numeric(input$FilterCases)
    out <- laceScores %>% 
      filter(readmit30 >= filterValue) %>%
      filter(L < input$LengthFilter)
    return(out)
  })
  
  output$lacePlot <- renderPlot({
    #paste plotting code here
    ggplot(laceData(), aes_string(x=input$DataCol, y="PredictedProb", color="readmitLevels")) + 
      geom_point() + scale_color_manual(values=c("Readmission"="red", "Not Readmission"="green")) +
      geom_smooth(stat = "smooth")
  })

  output$histLace <- renderPlot({
    ggplot(laceData(), aes_string(x="LACE", fill = "readmitLevels")) + geom_histogram() +
      scale_fill_manual(values=c("Readmission"="red", "Not Readmission"="green"))
  })
  
})
