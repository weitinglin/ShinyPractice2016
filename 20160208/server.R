#20160208 Shiny App practice 02
library(shiny)
shinyServer(function(input,output){
    output$plotDisplay <- renderPlot({
      hist(rnorm(input$number), main = input$comment)
    })
  })