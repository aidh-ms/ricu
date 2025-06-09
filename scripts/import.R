install.packages("ricu")
install.packages("units")

Sys.setenv(RICU_DATA_PATH = "/var/data")

library(ricu)

source("ricu/callbacks/callback-icu-mortality.R")
source("ricu/callbacks/callback-kdigo.R")
source("ricu/callbacks/callback-sepsis.R")

concept_path <- file.path("ricu", "configs", c("chemistry", "circulatory", "demographics", "hematology", "medications", "misc", "outcomes", "output", "vitals"))
dict <- load_dictionary(cfg_dirs = concept_path)

import_src("eicu")
# ricu::import_src("miiv")
# ricu::import_src("hirid")
# ricu::import_src("aumc")
# ricu::import_src("sic")

# TODO fst to parquet