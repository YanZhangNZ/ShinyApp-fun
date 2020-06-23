library(shiny)

ui <- fluidPage(
  titlePanel("this is a demo of fileInput and upload file"),
  
  sidebarLayout(
    
    sidebarPanel(
     
      fileInput("file","Choose a File"),
      helpText("Default max .file size is 5MB"),
      
      #for multiple file
      fileInput("multifile","Choose Multiple Files",multiple = T),
      uiOutput("selectfile"),
      
     ),
    
    mainPanel(
      
      uiOutput('tabs'),
      
      
      #for multiple file upload
      uiOutput("multitabs")
    )
  )
)
