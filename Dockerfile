FROM alpine:latest

RUN     apk update \
	&& apk upgrade \
        && apk add tzdata \
        && cp /usr/share/zoneinfo/Asia/Singapore /etc/localtime \
        && apk del tzdata \
        && apk add pdns \
        && apk add pdns-backend-sqlite3 \
	&& rm -rf /var/cache/apk/* \
        && echo "Asia/Singapore" > /etc/timezone \
	&&  mkdir -p /usr/src/app 

COPY pdns.sql /etc/pdns
COPY pdns.conf /etc/pdns
WORKDIR /etc/pdns
RUN sqlite3 powerdns.sqlite < pdns.sql        

WORKDIR /usr/src/app

COPY poddns.sh /usr/src/app

EXPOSE 8089
EXPOSE 9053
EXPOSE 53

CMD ["ash","./poddns.sh"]
