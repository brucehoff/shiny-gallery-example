FROM rocker/shiny

RUN apt-get update && apt-get install -y libxml2-dev

RUN mkdir -p /srv/shiny-server/gallery-example
COPY *.R /srv/shiny-server/gallery-example
COPY *.gif /srv/shiny-server/gallery-example
COPY data /srv/shiny-server/gallery-example/data
COPY clock-cache /srv/shiny-server/gallery-example/clock-cache



RUN R -e "options(repos = c(REPO_NAME = 'https://packagemanager.rstudio.com/all/__linux__/focal/latest',  getOption('repos'))); install.packages(c('shiny', 'leaflet', 'tidyverse', 'lubridate', 'promises', 'future'))"

