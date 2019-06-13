FROM rocker/shiny:latest

# Install Linux dependencies
RUN apt-get update && apt-get install -y \
    gdebi-core \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev

# Install R Packages w/ Dependencies    
RUN R -e "install.packages(c('dplyr', 'ggplot2', 'gridExtra', 'PAST', 'shinydashboard', 'shiny'), dependencies=TRUE)"


RUN cd /srv/shiny-server/

RUN chmod 755 /root

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
RUN chmod -R 755 /srv/shiny-server/

EXPOSE 3838

# Start the server with the container
CMD ["/usr/bin/shiny-server.sh"]
