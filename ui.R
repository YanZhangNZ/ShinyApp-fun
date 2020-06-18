library(shiny)

ui <- fluidPage(
  
  #title panel
  titlePanel(title = "This is title panel"),
  
  #sidebar layout
  sidebarLayout(
    
    #sidebar panel
    sidebarPanel(h3("this is sidebar panel for input"),h5("widget5")),
    
    #main panel
    mainPanel(h4("this is main panel for output"),h5("this is h5"))
    
  )
)