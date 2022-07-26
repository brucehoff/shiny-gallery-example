FROM rocker/shiny

RUN mkdir -p /srv/shiny-server/genome-browser
COPY *.R /srv/shiny-server/genome-browser/
COPY data /srv/shiny-server/genome-browser/
COPY www /srv/shiny-server/genome-browser/


RUN R -e "options(repos = c(REPO_NAME = 'https://packagemanager.rstudio.com/all/__linux__/focal/latest',  getOption('repos'))); install.packages(c('shiny', 'ggvis', 'dplyr'))"
