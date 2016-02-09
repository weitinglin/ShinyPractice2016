#20160209 shiny practice upload file server.R
#By defaut, the file size limit is 5 MB, It can be changed by setting this option.
options(shiny.maxRequestSize = 9*1024^2)

shinyServer(function(input,output){
  output$commets <-renderTable({
    inFile<-input$file1
    if (is.null(inFile))
      return(NULL)
    read.csv(inFile$datapath, header = input$header,
             sep = input$sep, quote = input$quote)
  })
})