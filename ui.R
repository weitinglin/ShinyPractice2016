##20160207 Practice
library(shiny)
shinyUI(pageWithSidebar(
# 標準layout，左方控制，右方輸出
  headerPanel("Minimal example"),  # interface title
  sidebarPanel(   #all UI controls go in here
    textInput(inputId = "comment", #the name of the variable passed to serverR
              label = "Say something?", # display the label
              value = ""
    )
  ),
    mainPanel(
    h3("This is you saying it"),
    textOutput("textDisplay") # this is the name of the output element as defined in server.R
    )
))