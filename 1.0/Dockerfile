FROM rocker/shiny:latest

# Install Linux dependencies
# Change permissions for R library
RUN chmod -R a+rwx /usr/local/lib/R/site-library
RUN apt-get update && apt-get install -y curl git libboost-all-dev \
    libgdal-dev libgdal20 libgit2-dev libproj-dev libssl-dev  \
    libudunits2-0 libudunits2-dev

# Install R Packages w/ Dependencies    
RUN R -e "install.packages(c('curl', 'devtools', 'digest', 'htmltools', 'httpuv', 'nneo', 'plyr', 'Rcpp', 'reshape2', 'scales', 'sf', 'stringi', 'units', 'yaml'))"
RUN R -e "install.packages(c('mime', 'glue', 'geosphere', 'ggplot2', 'gridExtra', 'jsonlite', 'leaflet', 'dplyr', 'DT', 'markdown', 'PAST', 'rgdal', 'tidyr'))"
RUN R -e "install.packages(c('shiny', 'shinydashboard', 'shinythemes', 'shinyWidgets', 'shinyBS', 'shinyjs', 'leaflet.extras','neonUtilities', 'magrittr'), dependencies=TRUE)"


RUN cd /srv/shiny-server/

# change app user
RUN useradd user1
RUN echo "user1:user1" | chpasswd
RUN mkdir /home/user1
RUN chown shiny:shiny /home/shiny

# Copy the Source Code of the app into the container
# COPY Server.R /srv/shiny-server/
# COPY Ui.R /srv/shiny-server/

RUN mkdir shiny-server
COPY shiny-server.conf /srv/shiny-server.conf

# change permission of the shiny folder where the app sits
RUN chmod -R 777 /srv/shiny-server


ENV PASSWORD "rstudio1"

EXPOSE 3838

# Start the server with the container
CMD ["/usr/bin/shiny-server.sh"]
