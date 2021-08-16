# A basic Shiny app for showing distributions and uncertainty in a basic dataset
Code for a "bare bones" shiny app for the Ecological Forecasting Initiative (EFI). This talk is intended to give you a sampling of code and tools for communicating risk and uncertainty to a broad audience. I will focus primarily on communication with stakeholders, but these tools should be broadly applicable.

## Packages
To follow along and run the app on your own machine, install the following packages:
```{r eval = FALSE}
install.packages(c("shiny",
                   "dplyr",
                   "ggplot2",        #for plotting
                   "ghibli",         #for plotting
                   "palmerpenguins", #for plotting
                   "hrbrthemes"))    #for plotting

```