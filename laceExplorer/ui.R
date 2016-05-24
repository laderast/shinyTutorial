
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
      selectInput("DataCol", "Data Covariate", choices = 
                    list("Length of Stay"="L", "Acuity"="A", "Comorbidities"="C", 
                         "ED Admits"="E", "LACE Score"="LACE"),selected="LACE"),
      ##sliderInput code goes here
      sliderInput("LengthFilter", "Filter by Length of Stay", min=0, max=7, value=7),
      checkboxInput("FilterCases","Filter Out Non Readmits", value = FALSE)
      
          ),
      
    # Display the plot
    mainPanel(
      #show the main x-y scatter plot here
      plotOutput("lacePlot") ,
      #can add another plot here
      plotOutput("histLace")
    )
  )
))
