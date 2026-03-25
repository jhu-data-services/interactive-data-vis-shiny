library(shiny)
library(bslib)
library(palmerpenguins)
library(ggplot2)

# load data
data(penguins, package = "palmerpenguins")

# remove missing values, in any row
penguins <- na.omit(penguins)
# rename the columns for clarity in app
colnames(penguins) <- c("Species",
                        "Island",
                        "Bill Length (mm)",
                        "Bill Depth (mm)",
                        "Flipper Length (mm)",
                        "Body Mass (g)",
                        "Sex",
                        "Year") 



ui <- page_sidebar(
  # App title
  title = 'Palmer Penguin Dashboard',
  
  # Sidebar for user inputs
  sidebar = sidebar(
    "This application uses data from the package:",
    # Code snippet
    code('palmerpenguins'),
    # Display image (works with url to image as well)
    img(src = 'penguins.png'),
    p("Artwork by @allison_horst")
  ),
  
  
  card(card_header("Scatterplot"), 
       plotOutput("scatterplot")),
  
)


server <- function(input, output) {
  
  output$scatterplot <- renderPlot({
    
    
    ggplot(penguins,
           aes(x = `Bill Length (mm)`,
               y = `Bill Depth (mm)`,
               color = Species)) +
      geom_point(size = 5,
                 alpha = 0.5) +
      theme_minimal(base_size = 15) +
      theme(legend.position = "bottom")
  })
  
}

shinyApp(ui, server)