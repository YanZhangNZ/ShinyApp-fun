library(shiny)

ui <- fluidPage(
  titlePanel("this is a demo of actionButton and isolate"),
  
  sidebarLayout(
    
    sidebarPanel(
      textInput("firstname","Enter your first name"),
      textInput("lastname","Enter your last name"),
      #action button to upate input info
      actionButton("action","Update last name"),
      p("click on the update button to update last name"),
      
      
      # Vs. submitButton("Submit")
      
      
      #dynamiclly update/view observation of selected dataset
      selectInput("dataset","Select a dataset",c("iris","trees","mtcars")),
      numericInput("num","Number of observations",6),
      
      actionButton("update","Click to change observation of selected dataset")
      
      
     ),
    
    mainPanel(
      textOutput("outputfirstname"),
      textOutput("outputlastname"),
      
      
      #for dynamic observations
      h4(textOutput("datasetname")),
      verbatimTextOutput("structure"),
      
      h4(textOutput("observations")),
      tableOutput("view")

    )
  )
)
