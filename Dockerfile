FROM r-base:4.5.0

RUN apt-get update -qq \
    && apt-get install --no-install-recommends -y \
        libudunits2-dev \
        r-base-dev \
        libcurl4-gnutls-dev \
        libxml2-dev

RUN Rscript -e 'install.packages("ricu")' \
    && Rscript -e 'install.packages("units")' \

ENV RICU_DATA_PATH=/var/data/

RUN mkdir -p /var/data
RUN mkdir -p /app

WORKDIR /app

COPY scripts/ .

CMD ["bash", "./start.sh"]