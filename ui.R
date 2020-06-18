library(shiny)

?sliderInput

ui <- fluidPage(
  
  #title panel
  titlePanel(title = "This is title panel"),
  
  #sidebar layout
  sidebarLayout(
    
    #sidebar panel
    sidebarPanel(
      ("Enter your personal information"),
      

      textInput("name","Enter your name",""),
      textInput("email","Enter your email",""),
      radioButtons("gender","Select the gender",list("Male","Female"),""),
      sliderInput("year","choose the year:",min=2000,max=2020,value=2018,step=5,animate = T),
      selectInput("statenames","Select the state",c("California","New York","Texas")),
      
      ),

    
    #main panel
    mainPanel(
      ("Personal Information"),
      textOutput("myname"),
      textOutput("myemail"),
      textOutput("mygender"),
      textOutput("myyear"),
      textOutput("mystate")
              )
               )
)
