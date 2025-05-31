install.packages("ricu")
install.packages("units")

Sys.setenv(RICU_DATA_PATH = "/var/data")

ricu::import_src("eicu")
# ricu::import_src("miiv")
# ricu::import_src("hirid")
# ricu::import_src("aumc")
# ricu::import_src("sic")

# TODO fst to parquet