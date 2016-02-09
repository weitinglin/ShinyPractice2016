#20160208 Server.R google analytics
library(shiny)
library(plyr)
library(ggplot2)
load("analytics.Rdata") # load the data frame

#above the section can use for data processing
#this chunk of the code will run every time the application launched
#========================================
#reactive objects
shinyServer({
passData <- reactive({
  analytics <-analytics[analytics$Date %in%
                          seq.Date(input$dateRange[1],
                          input$dateRange[2], by = "days"),]
#   analytics <- analytics[analytics$Hour %in%
#                            as.numeric(input$minimumTime):
#                            as.numeric(input$maximumTime),]
  analytics
})
# enclosed in the reactive parenthesis,it will work like a data.frame
 output$monthGraph <-renderPlot({
   graphData <- ddply(passData(), .(Domain, Date), numcolwise(sum))
   if (input$outputType == "visitors"){
     theGraph <-ggplot(
       graphData,aes(x = Date, y = visitors, group = Domain, colour = Domain)
       )+geom_line() + ylab("Unique visitors")     
   }
   if (input$outputType == "bounceRate"){
     theGraph <- ggplot(graphData, aes(x = Date, y = bounces / visits * 100,group = Domain,
                                       colour = Domain))+
                  geom_line()+ylab("Bounce rate %")
   }
   if (input$outputType == "timeOnSite"){
     theGraph <- ggplot(graphData, aes(x = Date, y = timeOnSite / visits,
                                       group = Domain, colour = Domain))+
       geom_line()+ylab("Average time on site")
   }
   if (input$smoother){
     theGraph <- theGraph + geom_smooth()
   }
   print(theGraph)
 })
  output$hourGraph <- renderPlot({
    graphData = ddply(passData(),.(Domain, Hour), numcolwise(num))
    if(input$outputType == "visitors"){
      theGraph <- ggplot(graphData,
                          aes(x = Hour, y = visitors, group = Domin,colour = Domain))+
                      geom_line()+ylab("Unique visitors")
    }
    if (input$outputType == "bounceRate"){
      theGraph <- ggplot(graphData,
                         aes(x = Hour, y = bounces / visits * 100, group = Domain,
                             colour = Domain))+
                          geom_line()+ ylab("Bounce rate %")
    }
    if (input$outputType == "timeOnSite"){
      theGraph <- ggplot(graphData,
                         aes(x = Hour, y = timeOnSite / visits, group = Domain,
                             colour = Domain))+
                          geom_line()+ylab("Average time on site")
    }
    if (input$smoother){
      theGraph <- theGraph+geom_smooth()
    }
    print(theGraph)
  })
  output$textDisplay <- renderText({
    paste(
      length(seq.Date(input$dateRange[1], input$dateRange[2],by = "days")),
      " days are summarised. There were", sum(passData()$visitors), "visitors in this time period.")
  })
})