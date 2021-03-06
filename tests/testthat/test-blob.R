context("blob")

test_that("adding large blob to table survives valgrind check (#192)", {
  con <- dbConnect(SQLite())
  on.exit(dbDisconnect(con), add = TRUE)

  data <- data.frame(id = 1, data = I(list(raw(1e8))))
  dbWriteTable(con, "data", data)
  dbReadTable(con, "data")
})
