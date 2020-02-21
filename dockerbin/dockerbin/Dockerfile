# set base OS image
FROM ubuntu:latest
#RUN sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger bionic main > /etc/apt/sources.list.d/passenger.list'
RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get install -y curl python3-distutils vim ufw language-pack-ja-base language-pack-ja ibus-mozc apt-transport-https ca-certificates python-pip python-dev python3-dev mariadb-server libmariadbclient-dev libssl-dev \
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3 get-pip.py \
    && pip install -U pip \
    && mkdir /code \
    && rm -rf /var/lib/apt/lists/*
    #&& localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8 \
    #&& apt-get install -y locales \
    #&& apt-get remove --purge resolvconf && apt-get -y install --reinstall resolvconf \
    #&& apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
WORKDIR /code
ADD requirements.txt /code

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py
RUN pip3 install -r requirements.txt
#RUN pip3 install conda
#RUN conda install -r requirements.txt

#RUN /etc/init.d/mysql start
#RUN update-locale LANG=ja_JP.UTF-8

EXPOSE 8000
EXPOSE 8001
EXPOSE 8002
EXPOSE 8003
EXPOSE 8004
EXPOSE 8005

