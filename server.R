library(shiny)

server <- function(input,output){
  output$output1 <- renderText({
    past("my first name is", input$text1)
  })
}