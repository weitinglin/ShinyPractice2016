#20160207 Practice:server R
library(shiny)

shinyServer(function(input,output){
  output$textDisplay <- renderText({ #mark function as reactive and assign to output$textDisplay for passing to ui.R
    paste0("You said '",input$comment,"'.There are ",nchar(input$comment),"characters in this.")
    
  })
  
  
})