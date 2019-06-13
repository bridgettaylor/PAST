FROM rocker/shiny:latest

# Change permissions for R library
RUN chmod -R a+rwx /usr/local/lib/R/site-library

# Install Linux dependencies
RUN RUN apt-get update && apt-get install -y curl git libboost-all-dev \
    libgdal-dev libgdal20 libgit2-dev libproj-dev libssl-dev  \
    libudunits2-0 libudunits2-dev

# Install R Packages w/ Dependencies    
RUN R -e "install.packages(c('dplyr', 'ggplot2', 'gridExtra', 'PAST', 'shinydashboard', 'shiny'), dependencies=TRUE)"

# Remove Shiny example inherited from the base image
RUN rm -rf /srv/shiny-server/*

RUN cd /srv/shiny-server/

RUN chmod 777 /root

# change app user
RUN useradd user1
RUN mkdir /home/user1
RUN chown user1:user1 /home/user1
USER user1

# Copy the Source Code of the app into the container
# COPY Server.R /srv/shiny-server/
# COPY Ui.R /srv/shiny-server/

COPY shiny-server.conf /srv/shiny-server/


# change permission of the shiny folder where the app sits
RUN chmod -R 777 /srv/shiny-server/

EXPOSE 3838

# Start the server with the container
CMD ["/usr/bin/shiny-server.sh"]
