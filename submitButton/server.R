library(shiny)


server <- function(input,output){
  
  output$output1 <- renderText({
    paste("My first name is: ", input$text1)
  })
  
  output$output2 <- renderText({
    paste("My last name is: ", input$text2)
  })
  
  
  
  #get dataset and output structure
  output$datasetname <- renderText({
    paste("structure of dataset",input$dataset)
  })
  
  output$structure <- renderPrint({
    #get function to get dataset, str function to get structure of dataset
    str(get(input$dataset))
  })
  
  #get observation and output views
  output$observation <- renderText(
    paste("first",input$obs,"observations of dataset")
  )
  output$view <- renderTable({
    head(get(input$dataset),n=input$obs)
  })
}