#' Módulo 1: Carga de datos (UI)
#'
#' Permite realizar la carga de datos de referencia y los datos a testear y
#' visualizarlos en sus respectivos marcos de datos.
#'
#' @param id Identificador
#'
#' @export

cargar_datosUI <- function(id) {

  sidebarLayout(

    sidebarPanel(

      with = 2,

      "CARGAR DATOS",

      fileInput(NS(id, "datref"),
                "Datos de Referencia",
                placeholder = "Archivo .tsv",
                buttonLabel = "Carga..."),

      fileInput(NS(id, "dattest"),
                "Datos a Comprobar",
                placeholder = "Archivo .tsv",
                buttonLabel = "Carga...")
      ),

    mainPanel(

      tabsetPanel(

        tabPanel(

          "Datos de Referencia",
          DT::DTOutput(NS(id, "tabref"))

        ),

        tabPanel(

          "Datos a Analizar",
          DT::DTOutput(NS(id, "tabtest"))

        )

      )

    )

  )

}

#' Módulo 1: Carga de datos (Server)
#'
#' @param id Identificador
#' @export

cargar_datosServer <- function(id) {

  moduleServer(id, function(input, output, session) {

    datos_referencia <- reactive({
      req(input$datref)

      ext <- tools::file_ext(input$datref$name)
      switch(ext,
             csv = vroom::vroom(input$datref$datapath, delim = ","),
             tsv = vroom::vroom(input$datref$datapath, delim = "|"),
             validate("Archivo no válido; Porfavor cargue un archivo .tsv"))
    })

    datos_test <- reactive({
      req(input$dattest)

      ext <- tools::file_ext(input$dattest$name)
      switch(ext,
             csv = vroom::vroom(input$dattest$datapath, delim = ","),
             tsv = vroom::vroom(input$dattest$datapath, delim = "|"),
             validate("Archivo no válido; Porfavor cargue un archivo .tsv"))
    })

    output$tabref <- DT::renderDT({
      datos_referencia()

    })

    output$tabtest <- DT::renderDT({
      datos_test()

    })

    datos_referencia
    datos_test

  })

}
