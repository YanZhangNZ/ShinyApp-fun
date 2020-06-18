library(shiny)


library(datasets)
data(iris)
summary(iris)

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
      
      br(),
      #input for iris histogram
      selectInput("variable","Select the quantitative Variable",c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")),
      sliderInput("BINs","select the number of histogram BINs by using the slide below:",min=5,max=25,value=15,step=1),
      radioButtons("color","Select the color of histogram",list("Green","Red","Yellow"),selected="Green"),
                 ),
    
    #main panel
    mainPanel(
      ("Personal Information"),
      textOutput("myname"),
      textOutput("myemail"),
      textOutput("mygender"),
      textOutput("myyear"),
      textOutput("mystate"),
      textOutput("text1"),
      textOutput("text2"),
      textOutput("text3"),
      plotOutput("myhist")
              )
               )
)

