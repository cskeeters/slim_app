#!/bin/bash

nginx_log_redir() {
    #log redirection
    ln -sf /dev/stdout /var/log/nginx/access.log
    ln -sf /dev/stderr /var/log/nginx/error.log
}

if [[ $1 == "serve" ]]; then
    /usr/bin/supervisord -c /etc/supervisor.conf

elif [[ $1 == "debug" ]]; then
    nginx_log_redir
    /usr/bin/supervisord -c /etc/supervisor.conf

elif [[ $1 == "bash" ]]; then
    cd /var/www/app/
    bash

elif [[ $1 == "simple" ]]; then
    cd /var/www/app/public
    php83 -S 0.0.0.0:80
else
    echo "init.sh doesn't support $1"
fi
