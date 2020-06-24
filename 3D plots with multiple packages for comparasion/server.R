library(shiny)
library(datasets)
library(rgl)
library(lattice) #trellis graph/quick 3d
library(car)

server <- function(input,output){

  #colors = c("red","blue","green")
  colors <- as.numeric(iris$Species)
  output$rglPlot <- renderPlot({
    with(
      iris,
      plot3d(iris[1:150,1:3],type="s"),
      color = colors
    )
  })
    

  


    output$irisPlot <- renderPlot({
    scatterplot3d(iris[,1:3],pch = 16, color = colors)
  })
    
    
    #as standard there is a box around the plot
    output$quickcarPlot <- renderPlot({
      cloud(Conduc~Na+pH,data=Soils) #cloud is for a box plot, wireframe is for a surface
      
    })
    
    
    #remove this in the initial step
    par.set <- list(
      axis.line = list(col="transparent"),
      clip=list(panel="off")
    )
    
    output$set1Plot <- renderPlot({
      cloud(
        Conduc~Na+pH,
        data = Soils,
        xlab = "Sodium Content",
        ylab = "Soil pH",
        zlab = "Soils",
        pch = 16,
        par.settings = par.set,
        groups = Depth,
        aspect = c(1,1),
        panel.aspect = 1,
        screen = list(z = 105, x = -70)
      )
      
    })
    
    
    output$set2Plot <- renderPlot({
      cloud(
        Conduc~Na+pH,
        data = Soils,
        xlab = "Sodium Content",
        ylab = "Soil pH",
        zlab = "Conductivity",#
        main = "Soils", #
        pch = 16,
        par.settings = par.set,
        groups = Depth,
        aspect = c(1,1),
        panel.aspect = 0.7, # size
        screen = list(z = 50, x = -50) #
      )
    })
    
}