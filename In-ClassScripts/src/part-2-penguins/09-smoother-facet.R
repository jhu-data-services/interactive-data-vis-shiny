library(shiny)
library(bslib)
library(palmerpenguins)
library(ggplot2)
library(RColorBrewer)

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

#display.brewer.all(type = "qual")
color_blind_palette <- brewer.pal(3, "Dark2") 
names(color_blind_palette) <-  c("Gentoo", "Adelie", "Chinstrap")

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
    
    checkboxGroupInput(
      inputId = "species",
      label = "Select Penguin Species",
      choices = c("Adelie" = "Adelie",
                  "Chinstrap" = "Chinstrap",
                  "Gentoo" = "Gentoo"),
      selected = c("Adelie", "Chinstrap", "Gentoo")
    ),
    
    # Add checkbox to turn on/off LOESS smoother and facet in ggplot2    
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
 
  )


server <- function(input, output) {
  
  
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
      # Enable geom and facet_wrap if input$value is TRUE
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
  
}

shinyApp(ui, server)