source("./global.R")

ui <- fluidPage(
  # App title ----
  titlePanel("Hello Shiny!"),

  # Sidebar layout with input and output definitions ----
  binUI("bin")
)

server <- function(input, output, session) {
  binServer("bin")
}

shinyApp(ui, server)
