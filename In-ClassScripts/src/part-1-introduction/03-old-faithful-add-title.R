library(shiny)
library(bslib)

# Define UI for app that draws a histogram ----
ui <- page_sidebar(
  # App title ----
  title = "Hello Shiny"
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
