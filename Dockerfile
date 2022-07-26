FROM rocker/shiny

RUN mkdir -p /srv/shiny-server/nyc-metro-vis
COPY *.R /srv/shiny-server/nyc-metro-vis
COPY *.gif /srv/shiny-server/nyc-metro-vis
COPY data /srv/shiny-server/nyc-metro-vis/data



RUN R -e "options(repos = c(REPO_NAME = 'https://packagemanager.rstudio.com/all/__linux__/focal/latest',  getOption('repos'))); install.packages(c('shiny', 'leaflet', 'tidyverse', 'lubridate', 'promises', 'future'))"

