library(shiny)

ui <- fluidPage(
  titlePanel("this is a demo of actionButton and isolate"),
  
  sidebarLayout(
    
    sidebarPanel(
      textInput("firstname","Enter your first name"),
      textInput("lastname","Enter your last name"),
      #action button to upate input info
      actionButton("action","Update last name"),
      p("click on the update button to update last name")
      
      
      # Vs. submitButton("Submit")
     ),
    
    mainPanel(
      textOutput("outputfirstname"),
      textOutput("outputlastname")

    )
  )
)

