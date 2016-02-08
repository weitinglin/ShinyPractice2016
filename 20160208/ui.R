#20160208 Shiny App practice 02
library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Minimal example"),
  sidebarPanel(
    textInput(inputId = "comment",
              label = "Say something?",
              value = ""
              ),
    numericInput(inputId = "number",
                 label = "add the observatino number",
                 value = 100)
  ),
  mainPanel(
    h3("This is the plot"),
    plotOutput(outputId = "plotDisplay"))
  )
)