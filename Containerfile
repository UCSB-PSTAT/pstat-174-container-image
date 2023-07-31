FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN apt update && \
    apt install -y arrow-dev && \
    apt-get clean

RUN R -e "install.packages(c('astsa'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

RUN pip install "gluonts[torch,mxnet,pro,R]" orjson

USER $NB_USER

