FROM debian:11.7

RUN apt-get update
RUN apt-get install -y nginx openssl

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools/nginx_www.sh /var/www

RUN chmod +x /var/www/nginx_www.sh

ENTRYPOINT [ "var/www/nginx_www.sh" ]

CMD ["nginx", "-g", "daemon off;"]
