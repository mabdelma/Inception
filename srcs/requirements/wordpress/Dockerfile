FROM debian:bullseye

RUN apt-get update && apt-get install -y \
	php7.4-fpm \
	php7.4-mysql \
	mariadb-client \
	curl && \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz

RUN cd /var/www && tar -xvf latest.tar.gz && \
	rm -rf latest.tar.gz
USER root

EXPOSE 9000

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp && \
    chmod +x /usr/local/bin/wp

RUN mkdir -p /run/php/

COPY ./conf/config.sh /var/www/wordpress/config.sh
RUN chmod +x /var/www/wordpress/config.sh

ENTRYPOINT ["bash", "/var/www/wordpress/config.sh"]

# docker system prune --all --force
# docker volume rm $(docker volume ls -q)