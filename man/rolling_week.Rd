% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{rolling_week}
\alias{rolling_week}
\title{Calculates rolling weeks backward from the end_date.}
\usage{
rolling_week(date_vector, end_date = as.Date(Sys.Date()))
}
\arguments{
\item{date_vector}{the vector of dates to group into weeks. Must be
in Date format or something that can be coerced to
Date by \code{\link[base]{as.Date}}.}

\item{end_date}{the day on which to start counting backwards. Defaults to
the current date, i.e. \code{Sys.Date}.}
}
\value{
a vector of weeks counting backward in time. The current week is
        numbered 1, the previous is numbered 2, etc. The week farthest in
        the past will currently return NA values so that you would mistakenly
        aggregate a week that may not be the full 7 days.
}
\description{
The purpose is to group a vector of dates into 7 day weeks
backward in time. For example, if the end date was 2020-06-09,
the days 2020-06-03 through 2020-06-09 would be one week,
2020-05-27 through 2020-06-02 would be another week, 2020-05-20
through 2020-05-26 another and so on. The function will work even
if the vector of dates is missing one or more dates in the series.
}
\examples{
#General
suppressPackageStartupMessages(library(dplyr))

date_vector1 <- seq.Date(from = as.Date("2020-01-01"), to = as.Date("2020-06-09"), by = 1)
data.frame(date = date_vector1,
           weeknum = rolling_week(date_vector = date_vector1,
                                  end_date = Sys.Date()))

#In a tidyverse pipe
tibble(tv_date = date_vector1) \%>\%
  mutate(
    tv_weeknum = rolling_week(tv_date, end_date = Sys.Date())
  )
}
