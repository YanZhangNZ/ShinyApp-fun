library(shiny)
library(shinydashboard)
library(plotly)

ui <- dashboardPage(
  dashboardHeader(title = "this is header", titleWidth = 500),
  dashboardSidebar(
    sidebarMenu(
      menuItem(text="About",tabName="about",icon=icon("clipboard")),
      menuItem("Data",tabName = "data", icon=icon("database"),badgeLabel = "new", badgeColor = "green"),
      menuItem(
        "Chart",
        tabName = "chart", 
        icon = icon("line-chart"),
        #downlist of sub menu
        menuSubItem("chartmenusub1",tabName = "chart1",icon = icon("line-chart")),
        menuSubItem("chartmenusub2",tabName = "chart2",icon = icon("line-chart"))
      ),
      menuSubItem("box",tabName = "box",icon = icon("check")),
      menuItem("Link",href="https://rstudio.io",icon=icon("code"))
    )
  ),
  dashboardBody(
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
      
      #grid for body
      tabItem(
        tabName = "box",
        
        #first row, having two boxes of same height, same width by default
        fluidRow(
          box(
            title = "Box with a plot",
            plotlyOutput("plot1",height = 250)
          ),
          box(
            title = "Box with another plot", 
            plotlyOutput("plot2",height=250),
            status = "danger",
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
            background = "red"
          ),
          box(
            title="Box with input widget",
            uiOutput("inputwidget"),
            width = 4,
            background = "black"
          )
       ),
      )
    )
  )
)
