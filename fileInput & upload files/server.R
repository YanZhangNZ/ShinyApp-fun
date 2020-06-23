library(shiny)


server <- function(input,output){
 
  readfile <- reactive({
    
    uploadedfile <- input$file
    if(is.null(uploadedfile)){return()}
    read.table(file=uploadedfile$datapath,header=TRUE,sep="",stringsAsFactors = FALSE)
  })


  
  output$filedf <- renderTable({
    if(is.null(readfile()))
     {return()}
    else
      input$file
  })
  
  
  output$table <- renderTable({
    if(is.null(readfile()))
    {return()}
    else
      head(readfile())
  })
  
  
  output$sum <- renderTable({
    if(is.null(readfile()))
    {return()}
    else
      summary(readfile())
  })
  
  
  output$tabs <- renderUI({
    if(is.null(readfile())){return()}
    else
      tabsetPanel(
        tabPanel("About File",tableOutput("filedf")),
        tabPanel("Data",tableOutput("table")),
        tabPanel("Summary",tableOutput("sum"))
      )
  })
  
  
  #dynamically render selected file list
  
  output$selectfile <- renderUI({
    if(is.null(input$multifile)){return()}
      list(hr(),
           selectInput("select","Select a file",choices=input$multifile$name)
           )
  })
  
  readselectedfile <- reactive({
    if(is.null(input$multifile)){return()}
    read.table(
      #get file whose name is been selected
      file=input$multifile$datapath[input$multifile$name==input$select]
      ,header=TRUE,sep="",stringsAsFactors = FALSE)
  })
  
  output$selectedtable <- renderTable({
    if(is.null(input$multifile)){return()}
    else
      readselectedfile()
  })
  
  output$selectedsum <- renderTable({
    if(is.null(input$multifile)){return()}
    else
      summary(readselectedfile())
  })
  
  output$multitabs <- renderUI({
    if(is.null(input$multifile)){return()}
    else
      tabsetPanel(
        #tabPanel("About File",tableOutput("selectedfiledf")),
        tabPanel("Data",tableOutput("selectedtable")),
        tabPanel("Summary",tableOutput("selectedsum"))
      )
  })
      
}