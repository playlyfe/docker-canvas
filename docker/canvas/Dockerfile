FROM ubuntu:12.04
MAINTAINER Johny Jose <johny@playlyfe.com>

RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties python g++ make
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update

RUN apt-get install -y ruby1.9.3 \
  zlib1g-dev libxml2-dev libmysqlclient-dev libxslt1-dev \
  imagemagick libpq-dev libxmlsec1-dev libcurl4-gnutls-dev \
  libxmlsec1 build-essential openjdk-7-jre unzip nodejs \
  passenger-common1.9.1 libapache2-mod-passenger apache2 \
  libsqlite3-dev git \
  && apt-get purge -y

RUN a2enmod rewrite
RUN a2enmod passenger

RUN gem install bundler --version 1.7.2
RUN gem install rake

# Configure locales
RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales

# Create canvas user
RUN adduser --disabled-password --gecos canvas canvasuser
RUN chown -R canvasuser /usr/lib/node_modules

VOLUME /var/canvas

COPY canvas /usr/bin/canvas
RUN chmod 755 /usr/bin/canvas
ENV CANVAS_LMS_ADMIN_EMAIL canvas_admin@mailinator.com
ENV CANVAS_LMS_ADMIN_PASSWORD admin123
ENV CANVAS_LMS_ACCOUNT_NAME Admin
ENV CANVAS_LMS_STATS_COLLECTION opt_in

ENTRYPOINT ["/usr/bin/canvas"]
