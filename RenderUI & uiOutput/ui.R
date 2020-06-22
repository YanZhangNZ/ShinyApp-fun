library(shiny)

ui <- fluidPage(
  titlePanel("this is a demo of dynamic UI -- renderUI"),
  
  sidebarLayout(
    
    sidebarPanel(
      selectInput("dataset","Select a dataset",c("iris","trees","mtcars")),

      p("The following selectInput drop down choices are dynamically populated based on the database selected by the user above"),

      
      #dynamic uiOutput
      uiOutput("vx"), #vx is coming from renderUI in server

      uiOutput("vy"), #vy is coming from renderUI in server
      
      
      
      #selectInput("varX","select the First(X) variable",c("xx","yy")),
      #selectInput("varY","select the second(Y) variable",c("aa","bb"))
    ),
    
    mainPanel(
      plotOutput("dynamicPlot")
    )
  )
)

