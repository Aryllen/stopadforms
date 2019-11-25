#' @title   mod_review_section_ui and mod_review_section_server
#' @description  Review and score the selected section of a submission
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_review_section
#'
#' @keywords internal
#' @importFrom shiny NS tagList 
mod_review_section_ui <- function(id) {
  ns <- NS(id)

  # Submissions
  submissions <- list("123-ABC", "456-DEF", "789-GHI")

  # Sections
  sections <- list("1a", "1b", "2", "3")

  tabPanel(
    "Review & score",
    fluidRow(
      column(
        4,
        offset = 1,
        selectInput(
          ns("submission"),
          "Select submission",
          choices = submissions,
          selected = "123-ABC"
        )
      ),
      column(
        4,
        selectInput(
          ns("section"),
          "Select section",
          choices = sections,
          selected = "1a"
        )
      )
    ),

    fluidRow(
      column(
        8,
        reactable::reactableOutput(ns("data_section_subset"))
      )
    ),

    fluidRow(
      column(
        4,
        numericInput(
          inputId = ns("section_score"),
          label = "Score",
          value = 1
        ),
        textAreaInput(
          inputId = ns("section_comments"),
          label = "Comments"
        )
      )
    )
  )
}

#' @rdname mod_review_section
#' @keywords internal
mod_review_section_server <- function(input, output, session) {
  submission <- reactive({ input$submission })
  section <- reactive({ input$section })
  to_show <- reactive({
    dplyr::filter(
      submission_data,
      submission == submission() & section == section()
    )
  })
  output$data_section_subset <- reactable::renderReactable({
    reactable::reactable(to_show())
  })
}