library(shiny)


ui <- fluidPage(
  
  titlePanel("this is demo of submitButton in shiny"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("text1","enter your first name"),
      textInput("text2",'enter your last name'),
      #submitButton("submit"),
      #p("click on the submit button to display the names on main panel")
    )
  ),
  
  
  mainPanel(
    textOutput("output1"),
    #textOutput("output2")
  )
  
)