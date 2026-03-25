library(shiny)
library(bslib)


ui <- page_sidebar(
  # App title
  title = 'Palmer Penguin Dashboard'
 
  )


server <- function(input, output) {
}

shinyApp(ui, server)
