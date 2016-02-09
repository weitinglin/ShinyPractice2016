#20160208 UI.R shiny app
library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Google Analytics"),
  sidebarPanel(
    dateRangeInput(
      inputId = "dateRange",
      label = "Date range",
      start = "2013-04-01",
      max = Sys.Date()
    ),
    sliderInput(
      inputId = "minimumTime",# a great widge on date select
      label = "Hours of interest- minimum",
      min = 0,
      max = 23,
      value = 0,
      step = 1),
    sliderInput(
      inputId = "maximumTime",# a great widge on date select
      label = "Hours of interest- maximum",
      min = 0,
      max = 23,
      value = 0,
      step = 1),
    checkboxInput(
      inputId = "smoother",
      label = "Add smoother?",
      value = FALSE
    ),
    checkboxGroupInput(
      inputId = "domainShow",
      label = "Show NHS and other domain (defaults to all)?",
      choices = list("NS users" = "NHS","Other" = "Other")
    ),
    radioButtons(
      inputId = "outputType",
      label = "Output required",
      choices = list("Visitors" = "visitors",
                     "Bounce rate" = "bounceRate",
                     "Time on site" = "timeOnSite")
    )),
    mainPanel(
      tabsetPanel(
        tabPanel("Summary",textOutput(("textDisplay"))),
        tabPanel("Monthly figures", plotOutput("monthGraph")),
        tabPanel("Hourly figures",plotOutput("hourGraph"))
        )
      )
   ) ) 