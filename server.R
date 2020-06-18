library(shiny)
data(iris) #load the iris dataset
data(mtcars)
data(trees)


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
  
  
  #download file
  datasetInput <- reactive({
    switch(input$dataset,
           "iris" = head(iris),
           "mtcars" = head(mtcars),
           "trees" = head(trees)
           )
  })
  
  fileext <- reactive({
    switch(input$format,
           "Excel"="csv",
           "Text"="txt",
           "Doc"="doc"
           )
  })
  
  
  output$table <- renderTable({
    datasetInput()
  })
  
  output$button <- downloadHandler(
    #return a string which tells the client
    #browser what name to use when saving the file
    filename = function(){
      #iris.png
      #iris.jpg
      paste(input$dataset,fileext(),sep=".")
    },
    #write data to a file given to it by 
    #the argument 'file'
    content =function(file){
      #open the device
      # create the plot
      #close the device
      sep <- switch(
        input$format,"Excel"=",","Text"="\t","DOC"=" ")
      
      #write a rile specified by the 'file' argument
      write.table(datasetInput(),file,sep=sep,row.names = FALSE)
    }
  )

  
}