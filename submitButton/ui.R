library(shiny)

ui <- fluidPage(
  

  titlePanel(title = "This is demo of submitButton"),
  

  sidebarLayout(
    
    sidebarPanel(
      textInput("text1","Enter your first name"),
      textInput("text2","Enter your last name"),
      
      
      
      #select dataset and observations
      selectInput("dataset","Select a dataset",c("iris","mtcars","trees")),
      numericInput("obs","Number of observations",6),
      
      #submitButton is a UI and also a function to control reactivity by default
      submitButton("Submit"),
      
      p("click on submit button to display names in main panel")
    ),

    

    mainPanel(
      textOutput("output1"),
      textOutput("output2"),
      
      
      
      #display dataset and observations
     textOutput("datasetname"),
     verbatimTextOutput("structure"),
      
     textOutput("observation"),
     tableOutput("view")
    )
    
  )
)



