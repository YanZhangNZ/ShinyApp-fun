library(shiny)

server <- function(input,output){
  
  output$myname <- renderText(input$name)
  output$myemail <- renderText(input$email)
  output$mygender <- renderText(input$gender)
}