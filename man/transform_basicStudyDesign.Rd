% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/transformBasicStudyDesign.R
\name{transform_basicStudyDesign}
\alias{transform_basicStudyDesign}
\title{Transform R dataframes into ImmPort basicStudyDesign.csv format}
\usage{
transform_basicStudyDesign(blocks, outputDir = NULL, validate = TRUE, ...)
}
\arguments{
\item{blocks}{a named list of the 9 data frames that comprise basic study design template}

\item{outputDir}{filepath to directory for output csv}

\item{validate}{boolean determining whether to use ImmPort validation scripts on output csv}

\item{...}{other arguments to pass down}
}
\description{
Based on ImmPort's specifications, the function validates
a group of dataframes holding metaData and then outputs a csv
for submission to the database.
}
