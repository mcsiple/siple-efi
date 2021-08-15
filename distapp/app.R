#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Accessory code for half-violin plots ------------------------------------
# We are using this code snippet, but there are other options for raincloud plots!
source("https://raw.githubusercontent.com/datavizpyr/data/master/half_flat_violinplot.R")


library(shiny)
library(palmerpenguins)


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Palmer penguins data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
           selectizeInput(inputId = 'island',
                       label = "Islands to show:",
                       choices = unique(penguins$island),
                       multiple = TRUE,
                       selected = "Torgersen")
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("raincloudPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$raincloudPlot <- renderPlot({
        # Palettes and theme ------------------------------------------------------
        penpal <- ghibli_palette("SpiritedMedium",direction = -1)
        pentheme <-  hrbrthemes::theme_ipsum_rc(base_size = 18) +
            theme(axis.title.x = element_text(size = rel(1.5)),
                  axis.title.y = element_text(size = rel(1.5)),
                  panel.grid.major.x = element_blank(),
                  panel.grid.minor.x = element_blank())
        
        
        # Plot stuff --------------------------------------------------------------
        
        p1 <- penguins %>% 
            filter(island %in% input$island) %>%
            ggplot(aes(x = sex, y = body_mass_g, fill = species)) +
            geom_flat_violin(position = position_nudge(x = .1, y = 0), 
                             adjust = 1.5, trim = FALSE, alpha = .5, colour = NA) +
            geom_point(aes(x = sex, y = body_mass_g, colour = species),
                       position = position_jitter(width = .05), size = 1, shape = 20) +
            geom_boxplot(aes(x = sex, y = body_mass_g, fill = species),
                         outlier.shape = NA, alpha = .5, width = .1, colour = "black") +
            scale_colour_manual("Species",values = penpal) +
            scale_fill_manual("Species",values = penpal) +
            xlab("Sex") +
            ylab("Body mass (g)") +
            coord_flip() +
            facet_wrap(~island,scale = "free_x",ncol = 1) +
            pentheme
        
        p1
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
