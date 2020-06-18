library(shiny)
data(iris) #load the iris dataset



server <- function(input,output){
  
  #output$myname <- renderText(input$name)
  #output$myemail <- renderText(input$email)
  #output$mygender <- renderText(input$gender)
  #output$myyear <- renderText(input$year)
  #output$mystate <- renderText(input$statenames)
  
  #reactive
  colm <- reactive({
    as.character(input$variable)
  })

  output$text1 <- renderText({
    paste("Column name is", names(iris[colm()]))
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
        iris[,colm()],
        
        col = input$color,
        )
    }
  )
  
  
  #render character
  output$str <- renderPrint({
    str(iris)
  })
  
  #render summary
  output$summary <- renderPrint({
    summary(iris)
  })
  
}