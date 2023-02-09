FROM alpine_neovim:latest
RUN apk add --no-cache nginx php81 php81-simplexml php81-fileinfo php81-opcache php81-fpm composer php81-intl supervisor

# Setup php-fpm
ADD php.ini /etc/php81/
ADD www.conf /etc/php81/php-fpm.d/

# Setup nginx
ADD default.conf /etc/nginx/http.d
RUN mkdir -p /var/log/app

ADD supervisor.conf /etc/supervisor.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.conf"]

ADD init.sh /
RUN chmod 755 /init.sh
ENTRYPOINT ["/init.sh"]
