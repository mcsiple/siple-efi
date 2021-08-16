# Showing distributions and uncertainty in R and Shiny
Code for a "bare bones" shiny app for the Ecological Forecasting Initiative (EFI). This talk is intended to give you a sampling of code and tools for communicating risk and uncertainty to a broad audience. I will focus primarily on communication with stakeholders, but these tools should be broadly applicable.

## Packages
To follow along and run the app on your own machine, install the following packages:
```{r eval = FALSE}
install.packages(c("shiny",
                   "dplyr",
                   "shinytest",
                   "ggplot2",        #for plotting
                   "ghibli",         #for plotting
                   "palmerpenguins", #for plotting
                   "hrbrthemes"))    #for plotting

```

## Other Shiny resources
### More code
If you want to explore more learning materials and exercises, check out my general shiny overview [repo](https://github.com/mcsiple/shinyoverview) collection of simple exercises. 

This repo also contains example code for:

- using `learnr` to make interactive tutorials
- putting live translation into your Shiny app using Appsilon's `shiny.i18n` [package](https://github.com/Appsilon/shiny.i18n)


### Reference materials:

[Mastering Shiny](https://mastering-shiny.org/) by Hadley Wickham for foundational learning

[Engineering Production-Grade Shiny apps](https://engineering-shiny.org/) from Colin Fay et al.

RStudio's [Shiny tutorials](https://shiny.rstudio.com/tutorial/)

