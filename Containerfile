FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN R -e "install.packages(c('astsa'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

RUN conda install -yc conda-forge orjson pyarrow

RUN python -m ensurepip --upgrade && \
    python -m pip install --upgrade setuptools && \
    python -m pip install --upgrade pip && \
    pip install gluonts[ext,torch,mxnet,pro,R]

USER $NB_USER
