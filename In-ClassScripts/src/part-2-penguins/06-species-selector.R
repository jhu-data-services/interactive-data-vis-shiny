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

    # Checkbox selector - returns a vector of strings, length 0, 1, 
    # 2, or 3, depending on the number of species selected
    checkboxGroupInput(
      inputId = "species",
      label = "Select Penguin Species",
      choices = c("Adelie" = "Adelie",
                  "Chinstrap" = "Chinstrap",
                  "Gentoo" = "Gentoo"),
      selected = c("Adelie", "Chinstrap", "Gentoo")
    ),
    
    hr(), 
    "This application uses data from the package:",
    code('palmerpenguins'),
    img(src = 'penguins.png'),
    p("Artwork by @allison_horst")),
  
  
  card(card_header("Scatterplot"),
       plotOutput("scatterplot")),
 
  )


server <- function(input, output) {
  
 # Reactive function - returns a filtered dataframe
 penguins_filter <- reactive({
   req(input$species)
   penguins |> dplyr::filter(Species %in% input$species)
 })
 
  output$scatterplot <- renderPlot({
    
    
    ggplot(penguins_filter(),
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