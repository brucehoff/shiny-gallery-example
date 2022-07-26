FROM rocker/shiny

RUN apt-get update && apt-get install -y libxml2-dev

RUN mkdir -p /srv/shiny-server/nyc-metro-vis
COPY *.R /srv/shiny-server/nyc-metro-vis
COPY *.gif /srv/shiny-server/nyc-metro-vis
COPY data /srv/shiny-server/nyc-metro-vis/data
COPY clock-cache /srv/shiny-server/nyc-metro-vis/clock-cache



RUN R -e "options(repos = c(REPO_NAME = 'https://packagemanager.rstudio.com/all/__linux__/focal/latest',  getOption('repos'))); install.packages(c('shiny', 'leaflet', 'tidyverse', 'lubridate', 'promises', 'future'))"

