FROM alpine:3.22
RUN apk add --update --no-cache nginx openssl 
RUN mkdir -p /var/www/html
EXPOSE 443

COPY conf/nginx.conf /etc/nginx/http.d/default.conf
COPY tools/certificado_https.sh /

RUN sh /certificado_https.sh

CMD ["nginx", "-g", "daemon off;"]

