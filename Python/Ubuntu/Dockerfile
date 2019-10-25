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
RUN pip3 install --upgrade pip
RUN pip install azure \
                bokeh \
                boto3 \
                catboost \
                ConfigObject \
                cython \
                dask \
                gcsfs \
                google-cloud \
                imbalanced-learn \
                joblib \
                jupyter \
                jupyterlab \
                keras \
                kmod \
                lightgbm \
                matplotlib \
                nltk \
                mxnet \
                numpy \
                numba \
                opencv-python \
                pandas \
                pillow \
                plotly \
                py4j \
                pyarrow \
                pyspark \
                requests \
                scikit-image \
                scikit-learn \
                scikit-plot \
                scipy \
                scrapy \
                seaborn \
                statsmodels \
                SQLAlchemy \
                Theano \
                tensorflow \
                torch \
                xgboost \
                XlsxWriter

RUN pip3 install 'prompt-toolkit<2.0.0,>=1.0.15' --force-reinstall
RUN echo 'alias pip="pip3"' >> /etc/bash.bashrc


#=====================#
#      Add users      #
#=====================#

RUN mkdir /home/work
RUN useradd anybody -r -d /home/work
WORKDIR /home/work


#=====================#
#    Some settings    #
#=====================#

EXPOSE 8899
COPY files_to_docker/spark_notebook.ipynb.template /home/work/spark_notebook.ipynb

#ENTRYPOINT ["cd /home/anybody && ipython3"]
#CMD ["/home/LaVoz_Propensity/run.sh"]
