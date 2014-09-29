
library(shiny)

shinyUI(fluidPage(
	
  # Application title
  titlePanel("Radabite VC Calculator"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      numericInput('pe', label = 'PE Ratio', min = 0, value = 15),
      numericInput('years', label = 'Years to exit', min = 0, max = 20, value = 5),
      numericInput('investment', label = 'Investment', min = 0, value = 3.5e6, step=5e4),
      numericInput('income', label = 'Income at exit', min = 0, value = 2.5e6, step=5e4),
      numericInput('exp_rr', label = 'Required IRR (%)', min = 0, value = '50'),
      numericInput('init_shares', label = 'Initial Shares', min = 0, value = 1e6, step=5e4)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      tableOutput('calculations')      
    )
  ),
  
  tags$img(src='images/RadabiteSharp.png')
))
