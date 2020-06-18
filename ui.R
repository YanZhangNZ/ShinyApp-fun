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
      
      #input for iris histogram
      selectInput("variable","Select the quantitative Variable",c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")),
      #sliderInput("BINs","select the number of histogram BINs by using the slide below:",min=5,max=25,value=15,step=1),
      radioButtons("color","Select the color of histogram",list("Green","Red","Yellow"),selected="Green"),
      br(),
      
      selectInput("var1","Select the x Variable",c("Sepal.Length","Petal.Length")),
      selectInput("var2","Select the y Variable",c("Sepal.Width","Petal.Width")),
      radioButtons("var3","select download format",c("png","pdf"),selected="png"),
                 ),

    
    #main panel
    mainPanel(
      ("Personal Information"),

      #tabset panel
      tabsetPanel(
        type="tab",
        tabPanel(("summary"),tableOutput("summary")),
        tabPanel("Structure",textOutput("str")),
        tabPanel(("Plot"),plotOutput("myhist")),
        tabPanel(("plot2"),plotOutput("download"),
                 downloadButton(outputId="down",label="download the plot")))
              )
    
    )
)



