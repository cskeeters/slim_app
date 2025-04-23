FROM alpine_neovim:latest
RUN apk add --no-cache nginx php83 php83-session php83-simplexml php83-fileinfo php83-opcache php83-fpm composer php83-intl supervisor

# Setup php-fpm
ADD php.ini /etc/php83/
ADD www.conf /etc/php83/php-fpm.d/

# Setup nginx
ADD default.conf /etc/nginx/http.d
RUN mkdir -p /var/log/app

ADD supervisor.conf /etc/supervisor.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.conf"]

ADD init.sh /
RUN chmod 755 /init.sh
ENTRYPOINT ["/init.sh"]
