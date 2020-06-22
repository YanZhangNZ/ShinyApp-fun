library(shiny)


server <- function(input,output){
 
  readfile <- reactive({
    
    uploadedfile <- input$file
    if(is.null(uploadedfile)){return()}
    read.table(file=uploadedfile$datapath,header=TRUE,sep="",stringsAsFactors = FALSE)
  })


  output$fileoutput <- renderTable({
    readfile()
  })
  
  output$filedf <- renderTable({
    if(is.null(readfile()))
     {return()}
    else
      input$file
  })
  
  output$table <- renderTable({
    if(is.null(readfile())){return()}
    else
      head(readfile(),n=6)
  })
  
  output$sum <- renderTable({
    if(is.null(readfile())){return()}
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
}