library(shiny)

ui <- fluidPage(
  titlePanel("this is a demo of fileInput and upload file"),
  
  sidebarLayout(
    
    sidebarPanel(
     
      fileInput("file","Choose File"),
      helpText("Default max .file size is 5MB"),
      
     ),
    
    mainPanel(
      
      uiOutput('tabs')
    )
  )
)
