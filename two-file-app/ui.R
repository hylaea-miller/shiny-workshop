# ---- user interface ----
ui <- navbarPage(
  
  # title ----
  title = "LTER Animal Data Explorer",
  
  # (Page 1) intro tabPanel ----
  tabPanel(title = "About this App",
           
           #intro text fluidrow
           fluidRow(
             column(1),
             column(10, includeMarkdown("text/about.md")),
             column(1)
             
           ), # END intro text fluidRow
           
           hr(),
           
           includeMarkdown("text/footer.md")
           
         
           
           ), # END (page 1) intro tabPanel
  
  # (Page 2) data tabPanel ----
  tabPanel(title = "Explore the Data",
           
           # tabset Panel to contain tabs for data viz ----
           tabsetPanel(
             
             # trout tabPanel ----
             tabPanel(
               title = "Trout",
               
               # trout sidebarLayout -----
               sidebarLayout(
                 
                 # trout sidebarPanel -----
                 sidebarPanel(
                   
                   # channel type pickerInput ----
                   pickerInput(inputId = "channel_type_input",
                               label = "Select channel type(s):",
                               choices = unique(clean_trout$channel_type),
                               selected = c("cascade", "pool"),
                               multiple = TRUE,
                               options = pickerOptions(actionsBox = TRUE)), # End of channel type picker input
                   
                   # section checkboxGroupButtons ----
                   
                   checkboxGroupButtons(inputId = "section_input",
                                        label = "Select a sampling section(s):",
                                        choices = c("clear cut forest", "old growth forest"),
                                        selected = c("clear cut forest", "Old groeth forest"),
                                        justified = TRUE,
                                        checkIcon = list(yes = icon("check", lib = "font-awesome"), 
                                                         no = icon("xmark", lib = "font-awesome"))), # END section checkboxGroupInput
              
                   
                 ), # END sidebarPanel
                 
                 # trout mainPanel ----
                 mainPanel(
                   
                   
                   plotOutput(outputId = "trout_scatterplot_output")
                   
                 ) # End trout mainPanel
                 
               ) # END panel
             
               
             ), # END trout tabPanel
           
             
              # penguins panel
            
            tabPanel(
              title = "Penguins",
              
              sidebarLayout(
                
                sidebarPanel(
                  
                  # island pickerInput ----
                  pickerInput(inputId = "penguin_island_input", 
                              label = "Select an island(s):",
                              choices = unique(penguins$island),
                              selected = unique(penguins$island),
                              options = pickerOptions(actionsBox = TRUE),
                              multiple = TRUE), # END island pickerInput
                  
                  # bin number sliderInput ----
            
                  sliderInput(inputId = "bin_num_input", 
                              label = "Select number of bins:",
                              min = 1, max = 100, value = 25), # END bin number sliderInput
                  
                ), # END penguin plot sidebarPanel
                
                mainPanel(
        
                  plotOutput(outputId = "flipper_length_histogram_output") 
                  
                ) # END penguin plot mainPanel
                
              ) # END sidebarLayout
              
            ) # END Penguins tabPanel
            
           ) #
           
           ) # END (Page 2) data tabPanel
  
) # End navbarPage