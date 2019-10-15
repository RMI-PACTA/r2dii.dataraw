# loanbook ----------------------------------------------------------------

path <- here::here("data-raw", "loanbook.csv")
loanbook <- vroom::vroom(path)
loanbook_template <- create_data_dictionary(loanbook)
# datapasta::tribble_paste(loanbook_template)

dic_loanbook <- tibble::tribble(
  ~definition,                                                                                                                                            ~column,                                  ~typeof,     ~dataset,
  "Unique loan identifier",                                                                                                                               "id_loan",                                "character", "loanbook",
  "Borrower identifier unique to each borrower/sector combination in loanbook",                                                                           "id_direct_loantaker",                    "character", "loanbook",
  "Name of the company directly taking the loan",                                                                                                         "name_direct_loantaker",                  "character", "loanbook",
  "Ultimate parent identifier unique to each ultimate parent/sector combination",                                                                         "id_ultimate_parent",                     "character", "loanbook",
  "Name of the ultimate parent company to which the borrower belongs. Can be the same as borrower",                                                       "name_ultimate_parent",                   "character", "loanbook",
  "Amount drawn by borrower from total credit limit",                                                                                                     "loan_size_outstanding",                  "double",    "loanbook",
  "Currency corresponding to outstandings",                                                                                                               "loan_size_outstanding_currency",         "character", "loanbook",
  "Total credit limit or exposure at default",                                                                                                            "loan_size_credit_limit",                 "double",    "loanbook",
  "Currency corresponding to credit limit",                                                                                                               "loan_size_credit_limit_currency",        "character", "loanbook",
  "Name of the sector classification standard being used",                                                                                                "sector_classification_system",           "character", "loanbook",
  "Flag identifying if the sector classification code or character description is used",                                                                  "sector_classification_input_type",       "character", "loanbook",
  "Sector classification code of the direct loantaker",                                                                                                   "sector_classification_direct_loantaker", "double",    "loanbook",
  "Financial instrument name or asset class",                                                                                                             "fi_type",                                "character", "loanbook",
  "Project finance flag denoting whether a loan is given out to a particular asset or not",                                                               "flag_project_finance_loan",              "character", "loanbook",
  "Required input for loans with the flag_project_finance_loan = TRUE: Name of the project being financed",                                               "name_project",                           "logical",   "loanbook",
  "Optional input: name of intermediate parent company within the company structure that can be used for more granular mapping than the ultimate parent", "name_intermediate_parent",               "logical",   "loanbook",
  "Optional input: providing the lei (legal entity identifier) of the direct loan taker to improve the matching coverage",                                "lei_direct_loantaker",                   "logical",   "loanbook",
  "Optional input: providing the isin identifier of the direct loan taker to improve the matching coverage",                                              "isin_direct_loantaker",                  "logical",   "loanbook"
)

# nace_classification -----------------------------------------------------

path <- here::here("data-raw", "NACE_classification.csv")
nace_classification <- vroom::vroom(path)
nace_template <- r2dii.dataraw::create_data_dictionary(nace_classification)
# datapasta::tribble_paste(nace_template)

dic_nace_classification <- tibble::tribble(
  ~definition,                                                                     ~column,         ~typeof,     ~dataset,
  "Original NACE code",                                                            "original_code", "double",    "nace_classification",
  "Formatted NACE code removing periods",                                          "code",          "double",    "nace_classification",
  "Level of granularity of NACE code",                                             "code_level",    "double",    "nace_classification",
  "Associated 2dii sector",                                                        "sector",        "character", "nace_classification",
  "Flag indicating if 2dii sector and classification code are a borderline match", "borderline",    "logical",   "nace_classification"
)

# isic_classification -----------------------------------------------------

path <- here::here("data-raw", "isic_classification.csv")
isic_classification <- vroom::vroom(path)
isic_template <- r2dii.dataraw::create_data_dictionary(isic_classification)
# datapasta::tribble_paste(isic_template)

dic_isic_classification <- tibble::tribble(
  ~definition,                                                                     ~column,      ~typeof,     ~dataset,
  "Original ISIC code",                                                            "code",       "character", "isic_classification",
  "Level of granularity of ISIC code",                                             "code_level", "double",    "isic_classification",
  "Associated 2dii sector",                                                        "sector",     "character", "isic_classification",
  "Flag indicating if 2dii sector and classification code are a borderline match", "borderline", "logical",   "isic_classification"
)

# data_dictionary ---------------------------------------------------------

data_dictionary <- tibble::tribble(
  ~dataset,          ~column,      ~typeof,     ~definition,
  "data_dictionary", "dataset",    "character", "The name of a dataset",
  "data_dictionary", "column",     "character", "The name of a dataset-column",
  "data_dictionary", "definition", "character", "The definition of a dataset-column"
)

data_dictionary <- dplyr::bind_rows(
  data_dictionary,
  dic_loanbook,
  dic_nace_classification,
  dic_isic_classification,
) %>%
  dplyr::arrange(dataset, column)

use_data(data_dictionary, overwrite = TRUE)
