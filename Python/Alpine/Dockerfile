FROM python:3-alpine

LABEL mantainer CRISTIAN ESTEBAN CONTRERA <cristiancontrera95@gmail.com>

ENV APPLICATION_NAME ALPINE_IPYTHON
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8


#=====================================#
#      Updating and needed tools      #
#=====================================#

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk --update add --no-cache lapack-dev gcc freetype-dev gfortran build-base
RUN apk add --no-cache build-base libffi-dev openssl-dev python-dev curl krb5-dev linux-headers zeromq-dev jpeg jpeg-dev
RUN apk add --update libxml2-dev libxslt-dev


#=====================================#
#    Install Python3 and packages     #
#=====================================#

RUN apk add python3 python3-dev ipython
RUN pip3 install --upgrade pip
RUN pip install azure \
                bokeh \
                boto3 \
                # catboost \
                ConfigObject \
                cython \
                dask \
                gcsfs \
                google-cloud \
                imbalanced-learn \
                jupyter \
                jupyterlab \
                # keras \
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
                # py4j \
                pyarrow \
                # pyspark \
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
                # tensorflow \
                # torch \
                xgboost \
                XlsxWriter

RUN pip install 'prompt-toolkit<2.0.0,>=1.0.15' --force-reinstall
#RUN echo 'alias pip="pip3"' >> /etc/bash.bashrc


#=====================#
#      Add users      #
#=====================#


RUN mkdir /home/work
WORKDIR /home/work


#=====================#
#    Some settings    #
#=====================#

EXPOSE 8899
COPY files_to_docker/spark_notebook.ipynb.template /home/corebi/spark_notebook.ipynb

#ENTRYPOINT ["cd /home/anybody && ipython3"]
#CMD ["/home/LaVoz_Propensity/run.sh"]
