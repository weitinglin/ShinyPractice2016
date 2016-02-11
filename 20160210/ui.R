#20160210 UI.R
library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Patient Opinion posts by area"),
  sidebarPanel(
    fileInput('file1','choose file to upload',
              accept =c(
                'text/csv',
                'text/comma-separated-values',
                'text/tab-separated-values',
                'text/plain',
                '.csv',
                '.tsv')
    ),
    radioButtons("area", "Service", c("Armadillo", "Baboon",
                                      "Camel","Deer", "Elephant"), 
                 selected = "Armadillo")
  ),
  mainPanel(
    h3("Total posts"),
    HTML("<p>Cumulative <em>totals</em> over time</p>"),
    plotOutput("plotDisplay"),
    htmlOutput("outputLink")
  )
))