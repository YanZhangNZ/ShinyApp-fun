library(shiny)


server <- function(input,output){
  
  output$output1 <- renderText({
    paste("My first name is: ", input$text1)
  })
  
  output$output2 <- renderText({
    paste("My last name is: ", input$text2)
  })
}