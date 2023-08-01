FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN apt install https://apache.jfrog.io/artifactory/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb && \
    apt update && \
    apt install -y libarrow-dev && \
    apt-get clean

RUN R -e "install.packages(c('astsa'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

RUN pip install "gluonts[torch,mxnet,pro,R]" orjson

USER $NB_USER

