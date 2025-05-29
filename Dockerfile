FROM r-base:4.5.0

RUN apt-get update -qq \
    && apt-get install --no-install-recommends -y \
        libudunits2-dev \
        r-base-dev \
        libcurl4-gnutls-dev \
        libxml2-dev

RUN Rscript -e 'install.packages("remotes")' \
    && Rscript -e 'remotes::install_github("eth-mds/ricu")' 

ENV RICU_DATA_PATH=/var/data/