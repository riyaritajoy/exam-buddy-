shinyUI(fluidPage(
  titlePanel("The Prediction"),
  sidebarLayout(
    sidebarPanel(
      helpText("The estimated price which will be displayed has to be agrred upon by the producer and the transporter"),
      sliderInput("km",
                  label = "Total number of kilometers to travel",
                  min = 0, max = 5000, value = 10),
      sliderInput("diesel",
                  label = "Available petrol in the vehicle",
                  min = 0, max = 1500, value = 10)),
    
    mainPanel(
      textOutput("text1"),
      textOutput("text2"),
      textOutput("text3")
      
    )
  )
)
)
