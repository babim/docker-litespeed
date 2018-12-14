FROM babim/ubuntubase:18.04

ENV DEBIAN_FRONTEND=noninteractive

# Download option
RUN apt-get update && \
    apt-get install -y wget bash && cd / && wget --no-check-certificate https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh && \
    chmod 755 /option.sh

RUN apt-get install software-properties-common inetutils-ping -y

ENV PHP_VERSION 5.6
RUN wget --no-check-certificate -O - https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20PHP%20install/litespeed_install.sh | bash

# Define mountable directories.
#VOLUME ["/var/log/apache2", "/var/www", "/etc/apache2", "/etc/php"]

EXPOSE 80 443

ENTRYPOINT ["/start.sh"]
#CMD ["supervisord", "-nc", "/etc/supervisor/supervisord.conf"]