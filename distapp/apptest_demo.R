library(testthat)
source("distapp/app.R")

testServer(server, {
  
  # Give input$island a value.
  session$setInputs(island = "Torgersen")
  
  cat("Now that the island is set to Torgersen, numSelected is: ", numSelected(), "\n")
  
  # Now update input$island to a new value
  session$setInputs(island = c("Torgerson","Biscoe"))
  
  # Check whether it works
  cat("After adding another island to the inputs, numSelected is: ", numSelected(), "\n")
})

# In your testing folder, the test looks like this:
testServer(server, {
  session$setInputs(island = c("Torgerson","Biscoe"))
  #cat("After adding another island to the inputs, numSelected is: ", numSelected(), "\n")
  expect_equal(numSelected(),2)
})

testServer(server, {
  session$setInputs(island = c("Torgerson","Biscoe"))
  expect_true(is.ggplot(output$raincloudPlot))
})
