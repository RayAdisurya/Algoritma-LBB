ui <- dashboardPage(
    
    dashboardHeader(title = "Youtube Videos"),
    
    dashboardSidebar(
        sidebarMenu(
            menuItem(text = "Popularity",tabName = "First",icon = icon("book")),
            menuItem(text = "Isolated Data",tabName = "Second",icon = icon("book")),
            menuItem(text = "Indexes",tabName = "Third",icon = icon("book")),
            menuItem(text = "Optimal Upload Times",tabName = "Fourth",icon = icon("book"))
            )
    ),
    dashboardBody(
        tabItems(
            tabItem(tabName = "First",
                    fluidPage(
                        fluidRow(
                            column(width = 2),
                            column(width = 8,
                                   h1("YouTube Trends",align="center"),
                                   h2("In this little project, we will take a peek at trends on YouTube",align="center")),
                            column(width = 2)
                        ),
                        tags$br(),
                        fluidRow(box(width = 6,title = "Top Categories Based on Aveage Views", status = "info", solidHeader = T,
                                     plotlyOutput(outputId = "plot_t1")),
                                 box(width = 6,title = "Top Categories Based on Total Views", status = "info", solidHeader = T,
                                     plotlyOutput(outputId = "plot_t2")),
                        ))),
            tabItem(tabName = "Second",
                    fluidPage(
                        fluidRow(
                            tags$div(align="center",
                                     box(width = 12,status = "info",solidHeader = T,
                                         selectInput(inputId = "category_1",label = "Select a Category:", choices = levels(vids$category_id), selected = "Autos and Vehicles"),
                                         plotlyOutput(outputId = "plot_t3"))
                        ))),
                        tags$br(),
                        fluidRow(
                            tags$div(align="center",
                                     box(width = 12,status = "info",solidHeader = T,
                                         selectInput(inputId = "channel_1",label = "Select a Channel:", choices = levels(vids$channel_title), selected = "nigahiga"),
                                         plotlyOutput(outputId = "plot_t4"))
                        ))),
            tabItem(tabName = "Third",
                    fluidPage(
                        fluidRow(
                            tags$div(align="center",
                                     box(width = 12,title = "Likability Index", status = "info", solidHeader = T,
                                         plotlyOutput(outputId = "plot_t5"))
                        ))),
                        tags$br(),
                        fluidRow(
                            tags$div(align="center",
                                    box(width = 12,title = "Dislikability Index", status = "info", solidHeader = T,
                                        plotlyOutput(outputId = "plot_t6"))
                        )),
                        tags$br(),
                        fluidRow(
                            tags$div(align="center",
                                box(width = 12,title = "Positivity Index", status = "info", solidHeader = T,
                                    plotlyOutput(outputId = "plot_t7"))
                        ))),
            tabItem(tabName = "Fourth",
                    fluidPage(
                        fluidRow(
                            tags$div(align="center",
                                 box(width = 12,status = "info",solidHeader = T,
                                     selectInput(inputId = "category_2",label = "Select a Category:", choices = levels(vids$category_id), selected = "Autos and Vehicles"),
                                     plotlyOutput(outputId = "plot_t8"))
                        )))
                        )))
)