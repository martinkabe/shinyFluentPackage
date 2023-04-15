
#' Run app function
#'
#' @return
#' @export
#'
#' @example
#' runApp('app')
runApp <- function(app) {
  # locate all the shiny app that exist
  validExamples <- list.files(system.file("shiny-app", package = "shinyFluentPackage"))

  validExamplesMsg <-
    paste0(
      "Valid examples are: '",
      paste(validExamples, collapse = "', '"),
      "'"
    )

  # if an invalid app is given, throw an error
  if (missing(app) || !nzchar(app) ||
      !app %in% validExamples) {
    stop(
      'Please run `runApp()` with a valid app app as an argument.\n',
      validExamplesMsg,
      call. = FALSE
    )
  }

  # find and launch the app
  appDir <- system.file("shiny-app", app, package = "shinyFluentPackage")
  shiny::runApp(appDir, display.mode = "normal")
}
