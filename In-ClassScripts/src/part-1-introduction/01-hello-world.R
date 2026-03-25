library(shiny)
library(bslib)

ui <- page_sidebar(
  title = "Hello, world!"
)

server <- function(input, output) {
}

shinyApp(ui, server)