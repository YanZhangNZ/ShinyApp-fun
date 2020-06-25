library(shiny)
library(shinydashboard)
library(datasets)
library(plotly)
View(iris)

server <- function(input,output,session){
 #output data table for the 2nd row
  output$data <- renderTable({
    head(iris)
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
  
  
  #infobox output
  output$min_ <- renderInfoBox({
    infoBox(
      title = "Minm",
      value = min(mtcars$mpg),
      subtitle = "minimum value of mpg",
      fill = T
    )
  })
  output$max_ <- renderInfoBox({
    infoBox(
      title = "Maxm",
      value = max(mtcars$mpg),
      subtitle = "maxmum value of mpg",
      fill = T,
      color = "green"
    )
  })
  output$median_ <- renderInfoBox({
    infoBox(
      title = "Medn",
      value = median(mtcars$mpg),
      subtitle = "median value of mpg",
      fill = T,
      color = "yellow"
    )
  })
  
  
  #valuebox output
  output$min <- renderValueBox({
    valueBox(
      value = min(mtcars$mpg),
      subtitle = "minimum value of mpg",
      icon("arrow-up"),
    )
  })
  output$max <- renderValueBox({
    valueBox(
      value = max(mtcars$mpg),
      subtitle = "maxmum value of mpg",
      color = "green"
    )
  })
  output$median <- renderValueBox({
    valueBox(
      value = median(mtcars$mpg),
      subtitle = "median value of mpg",
      color = "yellow"
    )
  })
  output$mean <- renderValueBox({
    valueBox(
      value = mean(mtcars$mpg),
      subtitle = "mean value of mpg",
      icon("angle-double-right"),
      color = "purple"
    )
  })
      
}