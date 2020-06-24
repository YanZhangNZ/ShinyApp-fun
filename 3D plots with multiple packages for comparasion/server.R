library(shiny)
library(datasets)
library(rgl)
library(lattice) #trellis graph/quick 3d
library(scatterplot3d) #df needs to be converted to be matrix
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
    
    # first lattice plot
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
    
    #second lattice plot
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
    
    #scatterplot3d
    SoilMatrx <- as.matrix(Soils)
    xl <- SoilMatrx[,13] # column na -- Sodium content
    yl <- SoilMatrx[,6] # column pH -- soil pH
    zl <- SoilMatrx[,14] # Conduc -- conductivity
    sp1 <- scatterplot3d(xl,yl,zl,highlight.3d = T,pch=16,angle = 50,type="h",
                         xlab = "Sodium content",
                         ylab = 'Soil pH',
                         zlab = 'Conductivity')
    
    #creating a plot
    output$scatterplot3d <- renderPlot({
      sp1 <- scatterplot3d(xl,yl,zl,highlight.3d = T,pch=16,angle = 50,type="h",
                    xlab = "Sodium content",
                    ylab = 'Soil pH',
                    zlab = 'Conductivity')
    })
    
  #create a model to fit the plane
    Mod.1 <- lm(Conduc~Na+pH,data = Soils)
    
  #scatter with linear model
    output$linearModel <- renderPlot({
      sp1 <- scatterplot3d(xl,yl,zl,highlight.3d = T,pch=16,angle = 50,type="h",
                           xlab = "Sodium content",
                           ylab = 'Soil pH',
                           zlab = 'Conductivity')
      sp1$plane3d(Mod.1,lty.box = "solid")
    })
   

    
}