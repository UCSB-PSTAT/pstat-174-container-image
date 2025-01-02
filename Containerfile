FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN R -e "install.packages(c('astsa'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

RUN conda install -yc conda-forge orjson pyarrow

RUN python -m ensurepip --upgrade && \
    python -m pip install --root-user-action=ignore --upgrade setuptools && \
    python -m pip install --root-user-action=ignore --upgrade pip && \
    python -m pip install --root-user-action=ignore gluonts[ext,torch,mxnet,pro,R] numpy==1.26.4

USER $NB_USER
