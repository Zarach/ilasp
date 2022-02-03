FROM tensorflow/tensorflow:2.2.0-gpu-jupyter


RUN pip install keras
RUN pip install pandas
RUN pip install sklearn
RUN pip install TorchVision
RUN pip install ProbLog
RUN pip install PySDD
RUN pip install PySwip

RUN apt-get update
RUN add-apt-repository ppa:swi-prolog/stable
RUN apt-get update
RUN apt-get -y install swi-prolog

RUN apt-get update
RUN apt -y install python3.8

RUN apt-get update
RUN apt-get -y install openssh-server
RUN service ssh start

RUN useradd -ms /bin/bash bedu

RUN apt-get -y install libpython2.7 wget liblua5.3-dev cmake g++ build-essential

RUN mkdir tmp
RUN cd tmp

RUN wget https://github.com/potassco/clingo/archive/refs/tags/v5.5.0.tar.gz
RUN tar -xzf v5.5.0.tar.gz
RUN cd clingo-5.5.0 && cmake CMakeLists.txt && make -j8 install && wget https://github.com/marklaw/ILASP-releases/releases/download/v4.1.1/ILASP-4.1.1-ubuntu.tar.gz && \
tar -xzf ILASP-4.1.1-ubuntu.tar.gz && mv ./ILASP /usr/local/bin && cd ../ && rm -rf ./tmp
