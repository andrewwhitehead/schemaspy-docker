FROM frolvlad/alpine-oraclejdk8:slim
ENV LC_ALL C
WORKDIR /app/
COPY start.sh conf ./
RUN apk update && \
    apk add --no-cache wget ca-certificates graphviz ttf-ubuntu-font-family java-postgresql-jdbc php5 && \
    mkdir lib && \
    wget -nv -O lib/schemaspy.jar https://github.com/schemaspy/schemaspy/releases/download/v6.0.0-rc2/schemaspy-6.0.0-rc2.jar && \
    wget -nv -O lib/mysql-connector-java.jar http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.42/mysql-connector-java-5.1.42.jar && \
    wget -nv -O lib/sqlite-jdbc.jar http://central.maven.org/maven2/org/xerial/sqlite-jdbc/3.18.0/sqlite-jdbc-3.18.0.jar && \
    apk del wget ca-certificates
RUN adduser -u 1000 -DG root default && \
    mkdir output && \
    chmod -R g+rwX .
USER default

EXPOSE 8080

CMD [ "sh", "start.sh" ]
