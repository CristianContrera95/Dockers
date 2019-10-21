FROM ubuntu:latest

LABEL mantainer CRISTIAN ESTEBAN CONTRERA <cristiancontrera95@gmail.com>

ENV APPLICATION_NAME COREBI_IPYTHON
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8


#=====================================#
#      Updating and needed tools      #
#=====================================#

RUN apt-get update --fix-missing && \
	apt-get install -y wget tar nano htop curl ssh gcc g++ libsm6 libxext6 libxrender-dev make apt-utils


#=====================================#
#    Install Python3 and packages     #
#=====================================#

RUN apt-get install -y python3 python3-pip ipython3
RUN pip3 install imbalanced-learn \
                 joblib \
                 matplotlib \
                 numpy \
                 pandas \
                 py4j \
                 pyarrow \
                 #pyspark \
                 scikit-learn \
                 scipy \
                 seaborn \
                 ConfigObject \
                 jupyter \
                 jupyterlab \
                 SQLAlchemy \
                 dask \
                 XlsxWriter \
                 opencv-python \
                 bokeh \
                 scikit-image \
                 xgboost \
                 catboost \
                 lightgbm \
                 keras \
                 tensorflow \
                 torch \
                 mxnet \
                 requests \
                 # Google cloud platform
                 gcsfs \
                 google-cloud \
                 # azure
                 azure \
                 # Amazon web services
                 boto3

RUN pip3 install 'prompt-toolkit<2.0.0,>=1.0.15' --force-reinstall
RUN echo 'alias pip="pip3"' >> /etc/bash.bashrc


#=====================#
#      Add users      #
#=====================#

RUN useradd corebi -m -r
# RUN mkdir /home/corebi
WORKDIR /home/corebi


#=====================#
#    Some settings    #
#=====================#

EXPOSE 8899
COPY files_to_docker/spark_notebook.ipynb.template /home/corebi/spark_notebook.ipynb.template

#ENTRYPOINT ["cd /home/anybody && ipython3"]
#CMD ["/home/LaVoz_Propensity/run.sh"]
