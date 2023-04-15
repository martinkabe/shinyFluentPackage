binUI <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(

      # Sidebar panel for inputs ----
      sidebarPanel(

        # Input: Slider for the number of bins ----
        sliderInput(
          inputId = ns("bins"),
          label = "Number of bins:",
          min = 1,
          max = 50,
          value = 30
        ),

        shiny.fluent::Text(variant = "xxLarge", sayHello())

      ),

      # Main panel for displaying outputs ----
      mainPanel(
        # Output: Histogram ----
        plotOutput(outputId = ns("distPlot")),

        div(
          class = 'anotherShinyApp',
          shinyAppDir(
            system.file("shiny-app/app2", package="shinyFluentPackage"),
            options=list(
              width="100%", height=700
            )
          )
        )
      )
    )
  )
}


binServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {

      output$distPlot <- renderPlot({

        x    <- faithful$waiting
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        hist(x, breaks = bins, col = "#007bc2", border = "white",
             xlab = "Waiting time to next eruption (in mins)",
             main = "Histogram of waiting times")

      })
    }
  )
}
