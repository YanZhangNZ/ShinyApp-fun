library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "this is header", titleWidth = 500),
  dashboardSidebar(
    sidebarMenu(
      menuItem(text="About",tabName="about",icon=icon("clipboard")),
      menuItem("Data",tabName = "data", icon=icon("database"),badgeLabel = "new", badgeColor = "green"),
      menuItem("Link",href="https://rstudio.io",icon=icon("code"))
    )
  ),
  dashboardBody("this is body")
)
