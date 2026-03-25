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
  title = 'Palmer Penguin Dashboard',
  
  # Sidebar for user inputs
  sidebar = sidebar(
    "This application uses data from the package:",
    # Code snippet
    code('palmerpenguins'),
    # Display image (works with url to image as well)
    img(src = 'penguins.png'),
    "Artwork by @allison_horst"
  )
)


server <- function(input, output) {
}

shinyApp(ui, server)