FROM alpine:3.22
RUN apk upgrade && \
	apk add --update --no-cache \
	php82\
	php82-fpm\
	php82-mysqli\
	php82-common\
	php82-ctype

COPY tools/setup.sh /

EXPOSE 9000

CMD ["sh", "setup.sh"]
