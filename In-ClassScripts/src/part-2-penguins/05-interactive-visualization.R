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
  sidebar = sidebar(
 
    # List selector based on the columns in a dataframe 
    varSelectInput(
      inputId = 'xvar', 
      label = 'X variable',
      data = dplyr::select(penguins, where(is.numeric), -Year),
      selected = 'Bill Length (mm)'
    ),
    
    varSelectInput(
      inputId = "yvar", 
      label = "Y variable",
      data = dplyr::select(penguins, where(is.numeric), -Year),
      selected = 'Bill Depth (mm)'
    ),
    
    # Visual line divider
    hr(), 
    
    "This application uses data from the package:",
    code('palmerpenguins'),
    img(src = 'penguins.png'),
    "Artwork by @allison_horst"),
  
  
  card(card_header("Scatterplot"),
       plotOutput("scatterplot")),
 
  )


server <- function(input, output) {
  
  output$scatterplot <- renderPlot({
    
    
    ggplot(penguins,
           # Coerce a string to a literal using the !! prefix
           aes(x = !!input$xvar,
               y = !!input$yvar,
               color = Species)) +
      geom_point(size = 5,
                 alpha = 0.5) +
      theme_minimal(base_size = 15) +
      theme(legend.position = "bottom")
  })
  
}

shinyApp(ui, server)