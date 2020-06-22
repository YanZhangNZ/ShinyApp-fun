library(shiny)


server <- function(input,output){
  output$outputfirstname <- renderText({
    paste("My first name is: ",input$firstname)
  })
  
  output$outputlastname <- renderText({
    
    #capture the button click event
    input$action
    #isolate() is to create dependency on the action button
    isolate(paste("My last name is: ",input$lastname))
    
  })
  
  
}