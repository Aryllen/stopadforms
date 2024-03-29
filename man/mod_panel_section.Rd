% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mod-panel-section.R
\name{mod_panel_section_ui}
\alias{mod_panel_section_ui}
\alias{mod_panel_section_server}
\title{mod_panel_section_ui and mod_panel_section_server}
\usage{
mod_panel_section_ui(id, submissions, sections)

mod_panel_section_server(input, output, session, synapse, syn,
  reviews_table)
}
\arguments{
\item{id}{shiny id}

\item{submissions}{Character vector of available submissions}

\item{sections}{Character vector of sections within submissions}

\item{input}{internal}

\item{output}{internal}

\item{session}{internal}

\item{synapse}{Synapse client (e.g. output of
`reticulate::import("synapseclient")`)}

\item{syn}{Synapse client object (e.g. output of `synapse$Synapse()`)}

\item{reviews_table}{Synapse table that stores the scores and comments}
}
\description{
View summarized scores for a submission
}
\keyword{internal}
