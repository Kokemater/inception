FROM alpine:3.22
RUN apk add --update --no-cache\
	mariadb\
	mariadb-client\
	mariadb-openrc\
	envsubst

COPY conf/my.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY conf/init.sql /
COPY tools/setup.sh /

EXPOSE 3306

CMD ["sh", "setup.sh"]
