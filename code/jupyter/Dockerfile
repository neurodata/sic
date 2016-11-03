FROM bids/ndmg:v0.0.33
MAINTAINER Greg Kiar <gkiar@jhu.edu>

USER root

RUN apt-get update && \
    apt-get install -y curl && \
    curl -sSL http://neuro.debian.net/lists/trusty.us-ca.full >> /etc/apt/sources.list.d/neurodebian.sources.list && \
    apt-key adv --recv-keys --keyserver hkp://pgp.mit.edu:80 0xA5D32F012649A5A9 && \
    apt-get update && \
    apt-get remove -y curl


RUN apt-get -y install python2.7 python-pip python-dev
RUN apt-get -y install ipython ipython-notebook &&\
		pip install --upgrade pip
RUN pip install jupyter

RUN useradd -m -s /bin/bash sic-user


RUN mkdir -p /home/sic-user/.jupyter
COPY jupyter_notebook_config.py /home/sic-user/.jupyter
COPY sic_ndmg.ipynb /home/sic-user
WORKDIR /home/sic-user

ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

USER sic-user
EXPOSE 8888
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]

