library(shiny)
data(iris) #load the iris dataset

server <- function(input,output){
  
  #reactive
  colm <- reactive({
    as.character(input$variable)
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
  
  
  #download plot
  x <- reactive({
    iris[,as.character(input$var1)]
  })
  y <- reactive({
    iris[,as.character(input$var2)]
  })
  output$download <- renderPlot({
    plot(x(),y())
  })
  #download handler
  output$down <- downloadHandler(
    filename = function(){
      #iris.png
      #iris.jpg
      paste("iris",input$var3,sep=".")
    },
    content =function(file){
      #open the device
      # create the plot
      #close the device
      #png()
      #pdf()
      if(input$var3 == "png")
        png(file)
      else
        pdf(file)
      plot(x(),y())
      dev.off()
    }
  )
}