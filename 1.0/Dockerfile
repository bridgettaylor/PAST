FROM bioconductor/release_base2:latest

# Change permissions for R library
RUN chmod -R a+rwx /usr/local/lib/R/site-library

# Install Linux dependencies
RUN apt-get update \
	&& apt-get install -y --no-install-recommends apt-utils

# Install R package for PAST
RUN Rscript -e 'BiocManager::install("PAST")'

# Install R Packages w/ Dependencies    
RUN R -e "install.packages(c('curl', 'devtools', 'dplyr', 'foreach', 'ggplot2', \
    'gridExtra', 'gvalue', 'iterators', 'parallel', 'doParallel', 'PAST', 'plyr', \
    'rlang', 'rtracklayer', 'shinydashboard', 'shiny', 'stats', 'tidyr', 'utils'), dependencies=TRUE)"
    
# Remove Shiny example inherited from the base image
RUN rm -rf /srv/shiny-server/

RUN /srv/shiny-server


# Copy the Source Code of the app into the container
# COPY Server.R /srv/shiny-server/
# COPY Ui.R /srv/shiny-server/


# change permission of the shiny folder where the app sits
RUN chmod -R 777 /srv/shiny-server

WORKDIR /srv/shiny-server/

# Start the server with the container
CMD ["/usr/bin/shiny-server.sh"]
