FROM rocker/shiny:latest

# Install Linux dependencies
RUN apt-get update && apt-get install -y curl git libboost-all-dev \
    libgdal-dev libgdal20 libgit2-dev libproj-dev libssl-dev  \
    libudunits2-0 libudunits2-dev libbz2-dev wget
    
# Install R Packages w/ Dependencies    
RUN R -e "if (!requireNamespace('BiocManager', quietly = TRUE)){install.packages('BiocManager')};BiocManager::install('PAST')"

# Install R packages that are required
RUN R -e "install.packages(c('curl', 'devtools', 'digest', 'dplyr', 'DT', \
    'ggplot2', 'ggthemes', 'glue', 'httr', 'htmlwidgets', \
    'htmltools', 'httpuv', 'lattice','leaflet', \
    'magrittr', 'markdown', 'mime', 'plyr', 'readr', \
    'RCurl', 'Rcpp', 'reshape2', 'rgdal', 'rjson', 'plotly', \
    'scales', 'shiny', 'shinyjs','shinythemes', 'shinycssloaders', \
    'shinyWidgets', 'shinyBS', 'sf', 'stringi', 'tidyr', \
    'units', 'yaml'), repos='http://cran.rstudio.com/')"

# Remove Shiny example inherited from the base image and replace with code for PAST
RUN rm -rf /srv/shiny-server/*
RUN cd /srv/shiny-server/
RUN wget https://raw.githubusercontent.com/IGBB/PAST/shiny/app.R
COPY app.R srv/shiny/server/

# change permission of the shiny folder where the app sits
RUN chmod -R 777 /srv/shiny-server

EXPOSE 3838

WORKDIR /srv/shiny-server/

# Start the server with the container
CMD ["/usr/bin/shiny-server.sh"]
