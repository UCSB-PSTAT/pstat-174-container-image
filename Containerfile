FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root


RUN conda install -yc conda-forge gluonts orjson pyarrow pytorch-lightning r-astsa r-bsts

RUN pip install chronos-forecasting pytorch-forecasting

USER $NB_USER
