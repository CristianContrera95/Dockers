FROM ubuntu:latest

LABEL mantainer CRISTIAN ESTEBAN CONTRERA <cristiancontrera95@gmail.com>

ENV APPLICATION_NAME COREBI_IPYTHON
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8


#=====================================#
#      Updating and needed tools      #
#=====================================#

RUN apt-get update --fix-missing && \
	apt-get install -y wget tar nano htop curl ssh gcc g++ libsm6 libxext6 libxrender-dev make apt-utils openjdk-8-jre ca-certificates


#=====================================#
#    Install Python3 and packages     #
#=====================================#

RUN apt-get install -y python3 python3-pip ipython3
RUN pip3 install --upgrade pip
COPY requeriments.txt requeriments.txt
RUN pip install -r requirements.txt

# Jupyter compatibility
RUN pip3 install 'prompt-toolkit<2.0.0,>=1.0.15' --force-reinstall
# Alias for comfort
RUN echo 'alias pip="pip3"' >> /etc/bash.bashrc


#=====================#
#    Install Spark    #
#=====================#

ARG SPARK_URL=http://archive.apache.org/dist/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz
RUN curl -s $SPARK_URL | tar xvz -C /opt/
RUN ln -s /opt/spark-2.4.3-bin-hadoop2.7 /opt/spark


#=====================#
#  Final Env config   #
#=====================#

ENV SPARK_HOME /opt/spark 
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV PATH $PATH:$SPARK_HOME/bin:$JAVA_HOME/bin
ENV PYTHON_PATH $SPARKHOME/python:PYTHON_PATH
ENV PYSPARK_PYTHON python3


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
COPY files_to_docker/ /home/work/


#=====================#
#   Command to run    #
#=====================#

#ENTRYPOINT ["cd /home/anybody && ipython3"]
#CMD ["/home/LaVoz_Propensity/run.sh"]
