FROM babim/centosbase:7

# option
RUN yum install -y curl bash && \
    curl https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh -o /option.sh && \
    chmod 755 /option.sh

# install litespeed and PHP
ENV PHP_VERSION 7.0
#ENV BUILDMODE on
RUN curl -s https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20PHP%20install/litespeed_install.sh | bash

# Define mountable directories.
VOLUME ["/usr/local/lsws"]

EXPOSE 80 443 8088 7080

# no supervisor
RUN touch /nosupervisor
ENTRYPOINT ["/start.sh"]
#CMD ["supervisord", "-nc", "/etc/supervisor/supervisord.conf"]