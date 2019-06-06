ui <- dashboardPage(
  title = "PAST",
  
  # set the title
  dashboardHeader(title = textOutput("title")),
  
  # create the sidebar
  dashboardSidebar(
    
    # create the menu
    sidebarMenu(
      
      # set the analysis title
      textInput("title", "Analysis Title", value = "New Analysis"),
      
      #create a selector for analysis type
      selectInput(
        "type",
        "Analysis Type:",
        choices = c("new", "saved"),
        selected = "new"
      ),
      
      # set the menu based on analysis type (see server)
      menuItemOutput("menuitem"),
      
      # create a plot submenu 
      menuItem(
        "Plot",
        
        # create a selector for filtering type
        selectInput(
          "filter_type",
          "Filter Parameter:",
          choices = c("p-value", "q-value"),
          selected = "p-value"
        ),
        
        # create a slider to specify filtering level
        sliderInput(
          "significance_cutoff",
          "Pathway Signficance Filter",
          min = 0,
          max = 0.3,
          value = 0.05,
          step = 0.01
        )
      )
    )
  ),
  
  # create the body
  shinydashboard::dashboardBody(fluidRow(
    
    # create the table view
    box(
      title = textOutput("box_title_table"),
      width = 4,
      status = "primary",
      solidHeader = TRUE,
      DT::dataTableOutput("pathways"),
      style = "height:82vh; overflow-y: scroll;"
    ),
    
    # create the graph view
    box(
      title = textOutput("box_title_plot"),
      status = "primary",
      color = "red",
      solidHeader = TRUE,
      width = 8,
      plotOutput("plots", height = "auto"),
      style = "height:82vh; overflow-y: scroll;"
    ),
    
    # add the download button
    downloadButton("download_data", 
                   "Download Results", 
                   style = "margin-left: 15px")
  ))
)
