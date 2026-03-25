library(shiny)
library(bslib)

# Define UI for app that draws a histogram ----
ui <- page_sidebar(
  # App title ----
  title = "Hello Shiny",
  sidebar = sidebar(
    # Input: Slider for the number of bins ----

    sliderInput(
      inputId = "bins",
      label = "Number of bins:",
      min = 1,
      max = 50,
      value = 30
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
