Sys.setenv(RICU_DATA_PATH = "/var/data")

library(ricu)

source("ricu/callbacks/callback-icu-mortality.R")
source("ricu/callbacks/callback-kdigo.R")
source("ricu/callbacks/callback-sepsis.R")

concept_path <- file.path("ricu", "configs", c("chemistry", "circulatory", "demographics", "hematology", "medications", "misc", "outcomes", "output", "vitals"))
out_path <- file.path("/var/data/output")

dict <- load_dictionary(cfg_dirs = concept_path)

src = c("eicu", "miiv")
# src = c("eicu", "miiv", "hirid", "aumc", "sic")

import_src(src)

concepts = concept_availability(cfg_dirs = concept_path)
for (s in src) {
    source_path = paste0(out_path, "/", s)
    if (!dir.exists(source_path)) {
        dir.create(source_path, recursive = TRUE)
    }

    for (concept in rownames(concepts)) {
        if (!concepts[concept, s]) {
            next
        }
        data = load_concepts(concept, s)
        arrow::write_parquet(data, paste0(source_path, "/", sprintf("%s.parquet", concept)))
    }
}
