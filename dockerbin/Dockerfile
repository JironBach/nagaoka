# set base OS image
FROM ubuntu:latest

# set Ruby installed Dir
ENV RUBY_DIR /ruby/
ENV RUBY_VERSION 2.6.5
ENV RUBY_INSTALL $RUBY_DIR/$RUBY_VERSION

# install packeges for installing Ruby
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install bzip2 make wget tar git nodejs autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev

# install Ruby with ruby-build
RUN mkdir $RUBY_DIR && \
    cd $RUBY_DIR    && \
    git clone https://github.com/sstephenson/ruby-build.git && \
    $RUBY_DIR/ruby-build/install.sh                         && \
    cd $RUBY_DIR/ruby-build && ./bin/ruby-build $RUBY_VERSION $RUBY_INSTALL && \
    rm -rf $RUBY_DIR/ruby-build
ENV PATH $RUBY_INSTALL/bin:$PATH

RUN apt-get -y install libmysqlclient-dev mysql-server libcurl4-openssl-dev
RUN /etc/init.d/mysql start

RUN gem install passenger
RUN passenger-install-nginx-module --auto --prefix=/opt/nginx

RUN gem install mysql2 && gem install bundler -v 2.0.1
RUN apt-get -y install language-pack-ja-base language-pack-ja ibus-mozc
RUN update-locale LANG=ja_JP.UTF-8

RUN apt-get -y install vim
#RUN apt-get remove --purge resolvconf && apt-get -y install --reinstall resolvconf
RUN apt-get -y install ufw

EXPOSE 8000
EXPOSE 8001
EXPOSE 8002
EXPOSE 8003
EXPOSE 8004
EXPOSE 8005

