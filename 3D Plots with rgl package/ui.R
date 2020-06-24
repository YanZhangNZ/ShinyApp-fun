library(shiny)

ui <- fluidPage(
  titlePanel("this is an example of 3D Plot"),
  
  sidebarLayout(
    sidebarPanel("this is sidebar"),
    
    mainPanel(
      h4("This is main page"),
      plotOutput("irisPlot")
    )
  ),
    


    )

