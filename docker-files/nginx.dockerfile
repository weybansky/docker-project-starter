FROM nginx:stable-alpine

COPY docker-files/nginx/ssl-certs/certificate.crt /etc/ssl/certs/
COPY docker-files/nginx/ssl-certs/private.key /etc/ssl/private/

COPY docker-files/nginx/default.conf /etc/nginx/conf.d/default.conf