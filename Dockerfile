FROM rocker/tidyverse:latest

COPY .config /home/rstudio/.config
COPY .Rprofile /home/rstudio/

RUN chown -R rstudio:rstudio /home/rstudio/

RUN install2.r --error --deps TRUE \
    slider \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN installGithub.r weecology/ratdat \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

