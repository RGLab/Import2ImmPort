context("getTemplateDF functions")

test_that("getSingleTemplate", {
  actual <- R2i:::getSingleTemplate("study_pubmed")
  expected <- ImmPortTemplates[ImmPortTemplates$templateName == "study_pubmed", ]

  expect_equal(actual, expected)
})

test_that("updateTypes", {
  jsonDataType <- c("date", "enum", "number", "positive", "string")

  actual <- R2i:::updateTypes(jsonDataType)
  expected <- c("character", "character", "double", "double", "character")

  expect_equal(actual, expected)
})

test_that("getTemplateDF", {
  actual <- getTemplateDF("planned_visit")
  expected <- data.frame("User Defined ID" = "",
                         "Name" = "",
                         "Order Number" = NA_real_,
                         "Min Start Day" = NA_real_,
                         "Max Start Day" = NA_real_,
                         "Start Rule" = "",
                         "End Rule" = "",
                         check.names = FALSE,
                         stringsAsFactors = FALSE)
  attr(expected, "templateName") <- "planned_visit"

  expect_equal(actual, expected)
})
