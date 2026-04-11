server <- function(input, output) {
  
  # Penguin scatterplot             
 output$penguin_scatterplot_output <- build_penguin_scatterplot(input)
  
  
  # Create penguin histogram 

  output$penguin_histogram_output <- build_penguin_histogram(input)
  
} # END server