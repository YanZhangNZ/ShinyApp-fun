library(shiny)
library(shinydashboard)
library(datasets)
library(plotly)
library(scatterplot3d)
library(RODBC)





dbconnection <- odbcDriverConnect(
  "Driver=SQL Server;
  Server=localhost;
  Database=AdventureWorksDW2019;
  trusted_connection=yes"
)
data <- sqlFetch(
  dbconnection, 
  'viewinternetsales', 
  colnames=F, 
  rows_at_time=1000
)


server <- function(input,output,session){
  

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
  
  #3d scatter plot for the 2nd row
  output$scatter <- renderPlot({
    scatterplot3d(Soils[,c(13,6,14)],highlight.3d = T,pch=16,angle = 50,type="h",
                  xlab = "Sodium content",
                  ylab = 'Soil pH',
                  zlab = 'Conductivity')
  })
  
  #line chart for the 2nd row
  output$linechart <- renderPlotly({
    plot_ly(
      data=data.frame(Soils), 
      x = ~Group,  
      y = ~Na,
      type = 'scatter', 
      mode = 'lines', 
      color = ~Contour , 
      colors = c("green","darkred","orange")) 
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
      icon = icon("usd"),
      fill = T,
      color = "yellow"
    )
  })
  output$mean_ <- renderInfoBox({
    infoBox(
      title = "Mean",
      value = mean(mtcars$mpg),
      icon = icon("usd"),
      subtitle = "Mean value of mpg",
      fill = T,
      color = "purple"
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

  
  #external sql database table output
  output$mydatatable <- renderTable({
    data[1:50,]
  })
  
  output$datasummary <- renderPrint({
    summary(data)
  })
  
  output$datastr <- renderPrint({
    str(data)
  })

}