#Install Packages
library(shiny)
library(BH)

ui <- fluidPage(
  sliderInput(inputId = "num",
  label = "Choose a number",
  value = 15, min = 1, max = 150),
  textInput(inputId = "title",
  label = "Write a title",
  value = "Histogram of Random Normal Values"),
  plotOutput("hist")
)

server <- function(input, output) {
  output$hist <- renderPlot({
  hist(rnorm(input$num),
  main = input$title)
  })
}
shinyApp(ui, server)