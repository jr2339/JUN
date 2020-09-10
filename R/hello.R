#' @title My Function
#'
#' @param name The name of the person to say hi to
#'
#' @return The ouput from \code{\link{print}}
#' @export
#'
#' @examples
#' hello("CS599")
#' \dontrun{
#' hello("J")
#' }
hello <- function(name) {
  print(paste0("Hello, ",name," ,this is the world!"))
}
