library(shiny)
data(iris) #load the iris dataset



server <- function(input,output){
  
  output$myname <- renderText(input$name)
  output$myemail <- renderText(input$email)
  output$mygender <- renderText(input$gender)
  output$myyear <- renderText(input$year)
  output$mystate <- renderText(input$statenames)
  
  #colm <- reactive({as.numeric(input$variable)})
  
  output$text1 <- renderText({
    paste("Data coloum is", input$variable)
  })
  
  output$text2 <- renderText({
    paste("Color of histogram is", input$color)
  })
  
  output$text3 <- renderText({
    paste("Number of histogram BINs is ", input$BINs)
  })
  
  output$myhist <- renderPlot(
    {
      hist(
        iris[,input$variable],
        
        col = input$color,
        )
    }
  )
  
}