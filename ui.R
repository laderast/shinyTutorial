
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("LACE Score Explorer"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      ##selectInput code goes here

    ##sliderInput code goes here (make sure to add a comma after the selectInput code!)

          ),
      
    # Display the plot
    mainPanel(
      plotOutput("lacePlot") #,
      #can add another plot here
    )
  )
))
