library(shiny)
library(shinydashboard)
library(datasets)
library(plotly)

server <- function(input,output,session){
 #output data table for the 2nd row
  output$data <- renderTable({
    head(mtcars)
  })
  
  #scatter plot of the 1st row
  output$plot1 <- renderPlotly({
    plot_ly(
      data=mtcars,
      x=~wt,
      y=~mpg,
      type="scatter",
      mode="markers"
    )
  })
  
 
  
  #dynamically render input widget for the 2nd row
  output$inputwidget <- renderUI({
    selectInput("selected","Select a variable",names(iris))
  })
  
  #histogram plot for the 1st row
  output$plot2 <- renderPlotly({
    
    plot_ly(
      data=iris,
      #x=~Sepal.Length,
      x=~get(input$selected),
      type="histogram"
    )
  })
      
}