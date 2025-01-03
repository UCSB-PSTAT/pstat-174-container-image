FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root


RUN conda install -yc conda-forge gluonts orjson pyarrow pytorch-lightning pytorch-forecasting r-astsa r-bsts

RUN pip install chronos-forecasting

USER $NB_USER
