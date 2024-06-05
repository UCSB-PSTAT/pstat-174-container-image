FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN R -e "install.packages(c('astsa'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

RUN mamba install -yc conda-forge orjson pyarrow 

RUN pip install gluonts[ext,torch,mxnet,pro,R]

USER $NB_USER
