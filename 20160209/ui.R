#20160209 shiny upload function UI.R
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
                '.tsv')
            ),
    tags$hr(),
    checkboxInput('header','Header', TRUE),
    radioButtons('sep','Separator',
                 c(Comma=',',
                   Semicolon=';',
                   Tab='\t'),','),
    radioButtons('quote','Quote',
                 c(None='',
                   'Double Quote'='"',
                   'Single Quote'="'"),'"') ,
    tags$hr() ,
    p('This is a practice demon')
  ),
  mainPanel(
    tableOutput('contents')
   )
  )
  ))