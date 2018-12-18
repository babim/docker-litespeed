FROM babim/centos7base

# option
RUN yum install -y wget bash && cd / && wget --no-check-certificate https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh && \
    chmod 755 /option.sh && yum remove -y wget

# install litespeed and PHP
ENV PHP_VERSION 5.4
#ENV BUILDMODE on
RUN wget --no-check-certificate -O - https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20PHP%20install/litespeed_install.sh | bash

# Define mountable directories.
VOLUME ["/usr/local/lsws"]

EXPOSE 80 443 8088 7080

# no supervisor
RUN touch /nosupervisor
ENTRYPOINT ["/start.sh"]
#CMD ["supervisord", "-nc", "/etc/supervisor/supervisord.conf"]