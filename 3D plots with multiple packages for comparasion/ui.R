library(shiny)

ui <- fluidPage(
  titlePanel("this is an example of 3D Plot"),
  
  sidebarLayout(
    sidebarPanel("this is sidebar"),
    
    mainPanel(
      tabsetPanel(
        tabPanel("scatter",plotOutput("irisPlot")),
        tabPanel("lattice",plotOutput("quickcarPlot")),
        tabPanel("latticeSet1",plotOutput("set1Plot")),
        tabPanel("latticeSet2",plotOutput("set2Plot")),
        tabPanel("rgl",plotOutput("rglPlot"))
      )
    )
  ),
    


    )

