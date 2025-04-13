#' Calcular percentil
#'
#' A partir de una vector se calculan los umbrales de cada percentil para luego
#' crear un nuevo vector con los valores percentiles de cada valor original
#'
#' @param x Vector numérico
#'
#' @returns Vector numérico con los respectivos percentiles
#' @export
#'

calc.perc <- function(x) {

  perc <- as.vector(stats::quantile(x, probs = seq(0, 1, 0.1)))

  datperc <- c()

  for (i in seq_along(x)) {

    if (x[i] < perc[2]) {

      nuper <- 0

    } else {

      for (j in seq(2,9)) {

        if (perc[j] <= x[i] && x[i] < perc[j+1]) {

          nuper <- j * 10 - 10

        } else {

          if (x[i] >= perc[10]) {

            nuper <- 90

          }

        }

      }

    }

    datperc <- c(datperc, nuper)

  }

  return(datperc)

}
