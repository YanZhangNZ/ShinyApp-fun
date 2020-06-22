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
    
    
    #dynamic tabs
    output$tabs <- renderUI({
      
      #lapply() to apply the tabPanel function on each of tab title to get a list of tabPanels
      #paste("tab no",1:input$n,sep="-") 
      Tabs <- lapply(paste("tab no",1:input$num, sep="-"),tabPanel)
      
      #call() to pass arguments together instead of one by one
      do.call(tabsetPanel,Tabs) #pass all argument of Tabs to tabsetPanel
    })
  
}