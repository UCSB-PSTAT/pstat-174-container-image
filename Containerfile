FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN R -e "install.packages(c('astsa'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

RUN mamba install -yc conda-forge "gluonts[torch,mxnet,pro,R]" orjson

USER $NB_USER
