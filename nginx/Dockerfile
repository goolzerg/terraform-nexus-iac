FROM nginx:1.19

COPY domain.crt domain.key default_proxy_headers /etc/nginx/
COPY vhost.conf /etc/nginx/conf.d/vhost.conf
