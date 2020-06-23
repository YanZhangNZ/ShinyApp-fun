library(shiny)
library(shinydashboard)

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
        menuSubItem("chartmenusub1",tabName = "chart1",icon = icon("line-chart")),
        menuSubItem("chartmenusub2",tabName = "chart2",icon = icon("line-chart"))
      ),
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
      )
    )
  )
)
