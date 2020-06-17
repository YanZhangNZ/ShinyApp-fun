library(shiny)

ui <- fluidPage(
  # input parameters: Id,label,value,...
  sliderInput(inputId = "num",
    label = "Choose a number",
    value = 25, min = 1, max = 100
              ),
  plotOutput("hist")
)

server <- function(input,output){
  output$hist <- renderPlot({
    title <- input$num "random normal values"
    hist(rnorm(input$num))})
}

shinyApp(ui = ui, server = server)
