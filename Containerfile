FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN cd /tmp && \
    wget "https://apache.jfrog.io/artifactory/arrow/ubuntu/apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb" && \
    apt install /tmp/apache-arrow-apt-source-*.deb && \
    apt update && \
    apt install -y libarrow-dev && \
    apt-get clean && \
    rm -f /tmp/apache-arrow-apt-source-*.deb

RUN R -e "install.packages(c('astsa'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

RUN pip install "gluonts[torch,mxnet,pro,R]" orjson

USER $NB_USER

