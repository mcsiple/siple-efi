library(testthat)
library(shinytest)
source("distapp/app.R")


# Example of a testServer() function --------------------------------------
testServer(server, {
  # Give input$island a value.
  session$setInputs(island = "Torgersen")
  
  cat("Now that the island is set to Torgersen, numSelected is: ", numSelected(), "\n")
  
  # Now update input$island to a new value
  session$setInputs(island = c("Torgerson","Biscoe"))
  
  # Check whether it works
  cat("After adding another island to the inputs, numSelected is: ", numSelected(), "\n")
})


# Using testServer() with testthat ----------------------------------------

# If your app is part of a package, many of these tests will be in tests/
testServer(server, {
  session$setInputs(island = c("Torgerson","Biscoe"))
  #cat("After adding another island to the inputs, numSelected is: ", numSelected(), "\n")
  expect_equal(numSelected(),2)
})
