library(shiny)
library(rpivotTable)

ui = shinyUI(fluidPage(
  fluidRow(dateRangeInput('dateRange',
                 label = 'Rango de Fechas: yyyy-mm-dd',
                 start = as.Date("2015-01-01"), end = Sys.Date() -1
  ))
 ,fluidRow(rpivotTableOutput('table' ))
  
))

server = function(input, output){
  output$table <- renderRpivotTable({
    iris %>%
      tbl_df %>%
      filter( Sepal.Width > 3 ) %>%
      rpivotTable
  })
}

shinyApp(ui = ui, server = server)