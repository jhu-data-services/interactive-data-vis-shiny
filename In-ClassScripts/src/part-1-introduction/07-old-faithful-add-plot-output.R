library(shiny)
library(bslib)

# Define UI for app that draws a histogram ----
ui <- page_sidebar(# App title ----
                   title = "Hello Shiny", sidebar = sidebar(
                     # Input: Slider for the number of bins ----
                     
                     sliderInput(
                       inputId = "bins",
                       label = "Number of bins:",
                       min = 1,
                       max = 50,
                       value = 30
                     )),
                    plotOutput("distPlot")
                   )

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(
      x,
      breaks = bins,
      col = "#75AADB",
      border = "white",
      xlab = "Waiting time to next eruption (in mins)",
      main = "Histogram of waiting times"
    )
  })
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)