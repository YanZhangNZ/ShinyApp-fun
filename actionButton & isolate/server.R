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
  
  
  #for dynamic observations of selected dataset

  output$datasetname <- renderText({
    paste("Structure of the dataset is", input$dataset)
  })
  
  output$structure <- renderPrint({
    str(get(input$dataset))
  })
  
  output$observations <- renderText({
    input$update
    isolate(paste("first",input$num,"observations of the dataset",input$dataset))
  })

  output$view <- renderTable({
    
    #capture the button click event
    input$update
    #isolate() is to create dependency on the action button
    isolate(head(get(input$dataset),n=input$num))
    
  })
}