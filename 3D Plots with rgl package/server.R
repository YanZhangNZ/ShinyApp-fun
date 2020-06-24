library(shiny)
library(rgl)
library(scatterplot3d)
library(datasets)

server <- function(input,output){

    with(
      iris,
      plot3d(iris[1:150,1:3],type="s"),
      color=as.integer(iris$Species)
    )
  
  colors <- as.numeric(iris$Species)
  
  output$irisPlot <- renderPlot({
    scatterplot3d(iris[,1:3],pch = 16, color = colors)
  })
  
}