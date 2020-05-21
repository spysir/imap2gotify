FROM python:3.8-alpine

RUN mkdir -p /app

RUN apk update && apk add ca-certificates \
    && rm -rf /var/cache/apk/* \
    && pip install requests toml simplejson

WORKDIR /app

ADD Imap.py Gotify.py imap2gotify.py /app/

VOLUME /app/config

CMD [ "python", "-u", "/app/imap2gotify.py" ]
