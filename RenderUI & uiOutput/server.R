library(shiny)
library(ggplot2)
library(datasets)

server <- function(input,output){
  
  # get column names of selected dataset
  var <- reactive({
    switch(input$dataset,
           "iris"=names(iris),
           "mtcars"=names(mtcars),
           "trees"=names(trees)
           )
  })
  
  #render UI, choices are the column names of selected dataset
  output$vx <- renderUI({
    selectInput("varx","Select the First(X) varialble",var())
  })
    
    output$vy <- renderUI({
      selectInput("vary","Select the Second(Y) variable",var())
    })
   
    #render plot
    output$dynamicPlot <- renderPlot({
      
      #attach the dataset
      attach(get(input$dataset))
      
      #plot
      plot(x=get(input$varx),y=get(input$vary),xlab=input$variablex,ylab=input$variabley)
    })
    
    
  
}