library(shiny)
library(bslib)
library(palmerpenguins)
library(ggplot2)
library(tidyr)
library(RColorBrewer)

data(penguins, package = "palmerpenguins")

# remove missing values, in any row
penguins <- na.omit(penguins)
colnames(penguins) <- c("Species",
                        "Island",
                        "Bill Length (mm)",
                        "Bill Depth (mm)",
                        "Flipper Length (mm)",
                        "Body Mass (g)",
                        "Sex",
                        "Year") 

# Custom color palette
color_blind_palette <- brewer.pal(3, "Dark2") 
names(color_blind_palette) <-  c("Gentoo", "Adelie", "Chinstrap")

ui <- page_sidebar(
  # App title
  title = 'Palmer Penguin Dashboard', 
  
  #Sidebar panel for inputs
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
  
    checkboxGroupInput(
      inputId = "species",
      label = "Select Penguin Species",
      choices = c("Adelie" = "Adelie",
                  "Chinstrap" = "Chinstrap",
                  "Gentoo" = "Gentoo"),
      selected = c("Adelie", "Chinstrap", "Gentoo")
    ),
   
    checkboxInput(inputId ="smoother", 
                  label = "Add smoother",
                  value= FALSE),
    
    checkboxInput(inputId ="facet", 
                  label = "Add facet by island",
                  value= FALSE),
    hr(), 
    "This application uses data from the package:",
    code('palmerpenguins'),
    img(src = 'penguins.png'),
    p("Artwork by @allison_horst")),
  
  card(card_header("Scatterplot"),
       plotOutput("scatterplot")),
  
  # Create a side by side layout for summary and table outputs
  layout_columns(
    card(card_header("Summary"),
       verbatimTextOutput("summary")),
    card(card_header("Dataframe"),
         tableOutput("table"),
         # Control the maximum height a card can take. Syntax 
         # derives from CSS.
         max_height = "400px"),
    # Control the width of each column. Values sum to 12, so
    # a value of c(3,9) would mean column 2 would be 3 times as 
    # wide as column 1
    col_widths = c(5.5,6.5)
  )
  
  
  
  )

  
display.brewer.all(type = "qual")
server <- function(input, output, session) {
  
 penguins_filter <- reactive({
   req(input$species)
   penguins |> dplyr::filter(Species %in% input$species)
 })
 # Use aes_string to pass the variables programmatically 
 # - they are returned from varSelectInput as strings
  output$scatterplot <- renderPlot({
    
 # character and literal values in aes   
    penguins_filter <- penguins |> dplyr::filter(Species %in% input$species)
    
    ggplot(penguins_filter(),
           aes(x = !!input$xvar,
               y = !!input$yvar,
               color = Species)) +
      geom_point(size = 5,
                 alpha = 0.5) +
      {if (input$smoother) geom_smooth()} +
      {if (input$facet) facet_wrap(vars(Island))} +
      xlim(c(min(penguins[input$xvar]), 
             max(penguins[input$xvar]))) +
      ylim(c(min(penguins[input$yvar]), 
             max(penguins[input$yvar]))) +
      scale_color_manual(values = color_blind_palette) +
      theme_minimal(base_size = 15) +
      theme(legend.position = "bottom")
  })

  # Create output statistical summary of filtered dataframe  
  output$summary <- renderPrint({
    summary(penguins_filter())
  })

  # Create output table to display filtered dataframe in app 
  output$table <- renderTable(penguins_filter()) 
  
}

shinyApp(ui, server)