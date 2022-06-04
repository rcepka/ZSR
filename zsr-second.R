

if (!require("pacman")) install.packages("pacman")

pacman::p_load(
  tidyverse,
  googlesheets4,
  lubridate
)


sheet_ID <- as_sheets_id(
  "https://docs.google.com/spreadsheets/d/1kUhiazmmowE3KzkOhwewDxpgmxcRS58sspStUDB6aKk/edit#gid=210397862") %>%
  as.character()


aa <- read_sheet(
  sheet_ID,
  sheet = "base",
  range = "A4:AF100",
  #range = cell_cols(c("A:B", "D:E")),
  skip = 3
  ) %>%
  select(-c(1:8), -10, -c(18:24), -32) %>%
  rename(
    Nominal.Capacity = 1,
    Measurement.Date.Initial = 2,
    U.No.load.Initial.Orig = 3,
    U.No.load.Initial.Adj = 4,
    R.Int.Initial.Orig = 5,
    R.Int.Initial.Adj = 6,
    C.Initial.Orig = 7,
    C.Initial.Adjusted = 8,
    Measurement.Date.Final = 9,
    C.Final.Orig = 10,
    C.Final.Adj = 11,
    U.No.load.Final.Orig = 12,
    U.No.load.Final.Adj = 13,
    R.Int.Final.Adj = 14,
    R.Int.Final.Orig = 15
    ) %>%
  mutate(
    Measurement.Date.Initial = str_sub(Measurement.Date.Initial, 1, stringr::str_length(Measurement.Date.Initial)-2 ),
    Measurement.Date.Initial = dmy(Measurement.Date.Initial)
  )
