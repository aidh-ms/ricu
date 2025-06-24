FROM r-base:4.5.0

RUN apt-get update -qq \
    && apt-get install --no-install-recommends -y \
        libudunits2-dev \
        r-base-dev \
        libcurl4-gnutls-dev \
        libxml2-dev

# RUN Rscript -e 'install.packages(c("ricu", "units", "arrow"))'
RUN Rscript -e 'install.packages(c("units", "arrow", "remotes"))'
RUN Rscript -e 'remotes::install_github("eth-mds/ricu")'

RUN mkdir -p /var/data
RUN mkdir -p /app

WORKDIR /app

COPY scripts/ .
COPY ricu/ ricu/

ENV RICU_DATA_PATH=/var/data/

CMD ["bash", "./start.sh"]