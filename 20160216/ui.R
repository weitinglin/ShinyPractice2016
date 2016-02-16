#20160209 shiny upload function UI.R
library(shiny)
shinyUI(fluidPage(
  titlePanel("Uploading Files") ,
  sidebarLayout(
    sidebarPanel(
    fileInput('file1','choose file to upload',
              accept =c(
                'text/csv',
                'text/comma-separated-values',
                'text/tab-separated-values',
                'text/plain',
                '.csv',
                '.tsv','.html')
            ),
    numericInput('pages_number','the_page_number', value=1, min=1, max=10, step=1 ),
    numericInput('table_number','the_table_number', value=1, min=1, max=10, step=1 ),
    downloadButton('downloadData', 'Download'),
    textInput("FileName","the name of the download file", value = "defaut"),
    p('This is a application to decrease the Clinical Labor')
  ),
  mainPanel(
    tableOutput('contents')
   )
  )
  ))