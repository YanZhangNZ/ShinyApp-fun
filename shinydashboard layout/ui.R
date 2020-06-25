library(shiny)
library(shinydashboard)
library(plotly)
library(shinycssloaders)
library(shinyBS) # for popover

ui <- dashboardPage(
  dashboardHeader(
    title = tags$a(href="https://rstudio.com/", icon("bar-chart"),"this is a demo of dashboard"),
    titleWidth = 500,
    tags$li(class="dropdown",tags$a(href="https://rstudio.com/",icon("youtube"),"Videos ",target="_blank")),
    tags$li(class="dropdown",tags$a(href="https://rstudio.com/",icon("linkedin"),"Information ")),
    tags$li(class="dropdown",tags$a(href="https://rstudio.com/",icon("github"),"Source Code "))
  ),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem(text="About",tabName="about",icon=icon("clipboard")),
      menuItem("Data",tabName = "data", icon=icon("database"),badgeLabel = "new", badgeColor = "green"),
      menuItem(
        "Chart",
        tabName = "chart", 
        icon = icon("line-chart"),
        #downlist of sub menu
        menuSubItem("infobox",tabName = "infobox",icon = icon("line-chart")),
        menuSubItem("valuebox",tabName = "valuebox",icon = icon("line-chart"))
      ),
      menuSubItem("box",tabName = "box",icon = icon("check")),
      menuItem("Link",href="https://rstudio.io",icon=icon("code"))
    )
  ),
  
  dashboardBody(
    tags$head(
      tags$link(rel="stylesheet", type = "text/css", href = "custom.css")
    ),
    #popover -- on mouse hover question icon 
    bsPopover(
      id = "q1", title = "Mean",
      content = "Mean value of mpg",
      trigger = "hover",
      placement = "right",
      options = list(container = "body")
    ),
    #popover -- on hover the valuebox
    bsPopover(
      id = "median_",
      title = "Median value of mpg",
      trigger = "hover",
      placement = "right",
      options = list(container = "body")
    ),
    
    tabItems(
      
      tabItem(
        tabName = "about",
        p("this is a demo of shinydashboard"),
        p("we will use iris dataset")
      ),
      
      
      tabItem(
        tabName = "data",
        dataTableOutput("mydatatable")
      ),
      tabItem(
        tabName = "infobox",
        fluidRow(
          infoBoxOutput("min_",width = 3),
          infoBoxOutput("max_",width = 3),
          infoBoxOutput("median_",width = 3),
          infoBoxOutput("mean_",width = 3)
        )
      ),
      tabItem(
        tabName = "valuebox",
          fluidRow(
            valueBoxOutput("min",width = 3),
            valueBoxOutput("max",width = 3),
            valueBoxOutput("median",width = 3),
            valueBoxOutput("mean",width = 3)
          )
        ),
      
      #grid for body
      tabItem(
        tabName = "box",
        
        #first row, having two boxes of same height, same width by default
        fluidRow(
           box(
            title = "Box with a plot",
            status = "success",
            solidHeader = T,
            withSpinner(plotlyOutput("plot1",height = 250))
          ),
         
         box(
           title = "Box with another plot", 
           withSpinner(plotlyOutput("plot2",height=250)),
           status = "success",
           solidHeader = T,
           collapsible = T
         )

        
        ),
        
        #second row, of different width
        fluidRow(
          box(
            title="Box with datatable",
            tableOutput("data"),
            width = 8,
            status = "success",
            solidHeader = T,
            
          ),
          box(
            title="Box with input widget",
            uiOutput("inputwidget"),
            width = 4,
            solidHeader = T,
            status = "success"
          )
       )
      )
    )
  )
)

