library(shiny)
library(bslib)
library(palmerpenguins)

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
  title = 'Palmer Penguin Dashboard'
 
  )


server <- function(input, output) {
}

shinyApp(ui, server)