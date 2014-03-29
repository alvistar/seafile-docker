FROM phusion/baseimage
MAINTAINER Alessandro Viganò

#EXPOSE 10001 12001 8000 8082

ENV SERVER_NAME example
ENV SERVER_ADDR seafile.example.com
ENV ADMIN_EMAIL admin@example.com
ENV ADMIN_PASSWORD changeme!

RUN mkdir /opt/seafile
WORKDIR /opt/seafile
RUN curl -L -O https://bitbucket.org/haiwen/seafile/downloads/seafile-server_2.1.5_x86-64.tar.gz
RUN tar xzf seafile-server_*
RUN mkdir installed
RUN mv seafile-server_* installed


RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y python2.7-mysqldb python-setuptools python-simplejson python-imaging sqlite3 && \
    apt-get install -y dnsmasq

RUN apt-get install -y tmux

#DNSMASQ SERVICE
RUN mkdir /etc/service/dnsmasq
ADD dnsmasq.sh /etc/service/dnsmasq/run

#SEAFILE SERVICES
RUN mkdir /etc/service/seafile
ADD seafilestart.sh /etc/service/seafile/run
ADD seafilestop.sh /etc/service/seafile/stop
RUN touch /etc/service/seafile/down

RUN mkdir /etc/service/seahub
ADD seahubstart.sh /etc/service/seahub/run
ADD seahubstop.sh /etc/service/seahub/stop
RUN touch /etc/service/seahub/down

RUN mkdir /opt/seafile/logs

VOLUME /opt/seafile
VOLUME /etc/service/seafile
VOLUME /etc/service/seahub

ADD bootstrap.sh /usr/local/bin/bootstrap

CMD /sbin/my_init
EXPOSE 22