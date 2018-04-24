shinyUI(fluidPage(
  titlePanel("The Prediction"),
  sidebarLayout(
    sidebarPanel(
      helpText("Want to know whether you'll pass or fail in your upcoming exam? Go ahead to find out !"),
      sliderInput("hours",
                  label = "Number of hours studied:",
                  min = 0, max = 100, value = 10),
      sliderInput("pages",
                  label = "Number of pages written:",
                  min = 0, max = 75, value = 10)),
    
    mainPanel(
      textOutput("text1"),
      textOutput("text2"),
      textOutput("text3")
      
    )
  )
)
)
