library(shiny)
library(shinydashboard)
library(DBI)
library(odbc)
library(RODBC)


dbconnection <- odbcDriverConnect(
  "Driver=SQL Server;
  Server=localhost;
  Database=MPTT;
  trusted_connection=yes"
  )
data <- sqlFetch(
  dbconnection, 
  'student_profile', 
  colnames=F, 
  rows_at_time=1000
  )


ui -> dashboardPage(
  
  dashboardHeader("this is for SQL connection"),
  
  dashboardSidebar(
    "this is sidebar"
    ),
  
  dashboardBody(
    "output database table",
    tableOutput("mydatatable"),
    #dataTableOutput()
  )
)

server <- function(input, output, session){
  
  output$mydatatable <- renderTable({
    head(data)
  })
  
}