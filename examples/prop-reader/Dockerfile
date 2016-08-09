FROM anapsix/alpine-java:8
MAINTAINER Kiwi Wen <kiwi.swhite.coder@gmail.com>

ENV APP_HOME /app
ENV APP_MAIN_CLASS org.kiwi.prop.reader.PropReader

RUN mkdir -p /app/config

COPY app-generate-props.sh /app/
COPY app-run.sh /app/

COPY config/ /app/config/
COPY app.jar /app/app.jar

RUN chmod +x /app/app-run.sh /app/app-generate-props.sh

WORKDIR /app

ENTRYPOINT ["/app/app-run.sh"]
CMD []
