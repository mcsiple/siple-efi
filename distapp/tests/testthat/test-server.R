
testServer(server, {
  session$setInputs(island = c("Torgerson","Biscoe"))
  #cat("After adding another island to the inputs, numSelected is: ", numSelected(), "\n")
  expect_equal(numSelected(),2)
})