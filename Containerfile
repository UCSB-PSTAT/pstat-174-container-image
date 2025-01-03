FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN R -e "install.packages(c('astsa'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

RUN conda install -yc conda-forge orjson pyarrow gluonts pytorch-forecasting

RUN pip install chronos-forecasting

USER $NB_USER
