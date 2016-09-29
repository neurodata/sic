FROM ubuntu:16.04
MAINTAINER Greg Kiar <gkiar@jhu.edu>

USER root

RUN apt-get update &&\
		apt-get -y install python2.7 python-pip python-dev
RUN apt-get -y install ipython ipython-notebook &&\
		pip install --upgrade pip
RUN pip install jupyter

RUN useradd -m -s /bin/bash sic-user

USER sic-user

RUN mkdir -p /home/sic-user/.jupyter
COPY jupyter_notebook_config.py /home/sic-user/.jupyter
WORKDIR /home/sic-user

ENTRYPOINT ["jupyter", "notebook"]
