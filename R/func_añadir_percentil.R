#' Añadir Percentil
#'
#' A partir de una base de datos, por cada columna con datos numéricos, se
#' añadirá una nueva columna con los valores de percentiles de la columna
#' original. Si se añade una segunda base de datos se realizará la adición de
#' los datos de percentiles a ambas bases de datos, obteniéndose los valores a
#' asignar a partir de la primera base de datos.
#'
#' @param x Data Frame de los datos de referencia
#' @param y Data Frame de nuevos datos
#'
#' @returns Si se introduce una base de datos, un data frame con los datos
#' originales y los datos de percentiles. Si se introducen dos bases de datos,
#' una lista con dos data frames, correspondientes a los dos introducidos.
#' @export
#'

adi.perc <- function(x, y = 0) {

  for (i in seq_along(x)) {

    if (is.numeric(x[[i]]) == TRUE) {

      dat <- FootManScout::calc.perc(x[[i]])

      x2 <- cbind(x, nuecol = dat)

      colnames(x2) <- c(colnames(x), paste0("Percentil-", colnames(x[i])))

      x <- x2

    }

  }

  if (is.data.frame(y) == FALSE) {

    return(x)

  } else {

    for (j in seq_along(y)) {

      if (is.numeric(y[[j]]) == TRUE) {

        dat <- FootManScout::calc.perc(y[[j]])

        y2 <- cbind(y, nuecol = dat)

        colnames(y2) <- c(colnames(y), paste0("Percentil-", colnames(y[j])))

        y <- y2

      }

    }

    lista <- list(x,y)

    return(lista)

  }

}
