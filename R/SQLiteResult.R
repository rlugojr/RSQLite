#' Class SQLiteResult
#'
#' SQLite's query results class.  This classes encapsulates the result of an
#' SQL statement (either `SELECT` or not).
#'
#' @export
#' @keywords internal
setClass("SQLiteResult",
  contains = "DBIResult",
  slots = list(
    sql = "character",
    ptr = "externalptr",
    conn = "SQLiteConnection"
  )
)

#' @rdname SQLiteResult-class
#' @export
setMethod("dbIsValid", "SQLiteResult", function(dbObj, ...) {
  rsqlite_result_valid(dbObj@ptr)
})
