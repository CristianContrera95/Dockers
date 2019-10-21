FROM ubuntu:latest

LABEL mantainer CRISTIAN ESTEBAN CONTRERA <cristiancontrera95@gmail.com>

ENV APPLICATION_NAME OPEN_CV
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update --fix-missing && apt-get install -y software-properties-common
RUN add-apt-repository 'deb http://security.ubuntu.com/ubuntu xenial-security main'

RUN apt-get update && apt-get install -y unzip wget git nano htop \
                                         cmake build-essential \
                                         qt5-default libvtk6-dev \
                                         zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev \
                                         libopenexr-dev libgdal-dev \
                                         libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev \
                                         libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm \
                                         libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev \
                                         libtbb-dev libeigen3-dev \
                                         python-dev python-tk python-numpy python3-dev python3-tk python3-numpy python3-pip ipython3 \
                                         ant default-jdk \
                                         doxygen apt-utils

#=====================================#
#           Install OpenCV            #
#=====================================#

RUN wget https://github.com/opencv/opencv/archive/3.4.3.zip -O /home
RUN unzip /home/3.4.3.zip && rm /home/3.4.3.zip
RUN mv /home/opencv-3.4.3 /home/OpenCV

RUN mkdir /home/OpenCV/build && \
    cd /home/OpenCV/build && \
    cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON -DENABLE_PRECOMPILED_HEADERS=OFF .. && \
    make -j4 && \
    make install && \
    ldconfig

#=====================================#
#           Install Darknet           #
#=====================================#

RUN cd /home && \
    git clone https://github.com/pjreddie/darknet.git && \
    cd darknet && \
    sed -i 's/OPENCV=0/OPENCV=1/' Makefile && \
    make

RUN wget https://pjreddie.com/media/files/yolov3.weights -O /home/darknet/
COPY ~/Projects/Corebi/Darknet/darknet53.conv.74 /home/darknet/

#=====================================#
#    Install Python3 and packages     #
#=====================================#

RUN pip3 install imbalanced-learn \
                 joblib \
                 matplotlib \
                 numpy \
                 pandas \
                 py4j \
                 pyarrow \
                 pyspark \
                 scikit-learn \
                 scipy \
                 seaborn \
                 ConfigObject \
                 jupyter \
                 SQLAlchemy \
                 dask \
#                 opencv-python \
                 XlsxWriter \
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

#=====================#
#        Alias        #
#=====================#



#=====================#
#   Command to run    #
#=====================#

# ENTRYPOINT ["cd /home/anybody"]

#CMD ["/home/LaVoz_Propensity/run.sh"]
