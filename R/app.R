#' App para el análisis de datos estadísticos con finalidades de Scouting
#'
#' Permite realizar diferentes análisis de las estadísticas recopiladas durante
#' la temporada para facilitar la búsqueda de jugadores. La aplicación se divide
#' en módulos, cada uno de los cuales se centra en un análisis diferente. El
#' Módulo 1 se encarga de la carga de los datos; el Módulo 2 se encarga del
#' análisis de percentiles; el Módulo 3 se encarga del análisis gráfico.
#' @export
#' @import shiny

FootManScoutApp <- function() {

  ui <- fluidPage(

    # theme

    # Título
    titlePanel("Análisi de Datos de Scouting en FM"),

    # Panel horizontal con diferentes pestañas (tabPanel).
    # Cada pestaña corresponde a un módulo.
    tabsetPanel(

      tabPanel(
        "Carga de datos",
        cargar_datosUI("mod1")
      ),

      tabPanel(
        "Análisis Percentil",
        analisis_percentilUI("mod2")),

      tabPanel(
        "Análisis Gráfico",
        analisis_graficoUI("mod3"))

  )

)

#' @param input Input
#' @param output Output

  server <- function(input, output) {

    cargar_datosServer("mod1")

    datos_referencia <- cargar_datosServer("mod1")
    datos_test <- cargar_datosServer("mod1")

  }

  # Arrancar la aplicación
  shinyApp(ui = ui, server = server)

}
