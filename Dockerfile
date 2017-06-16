FROM frolvlad/alpine-oraclejdk8:slim
ENV LC_ALL C
WORKDIR /app/
VOLUME /app/output
COPY start.sh conf ./
RUN apk update && \
	apk add --no-cache wget ca-certificates graphviz ttf-ubuntu-font-family java-postgresql-jdbc && \
	mkdir lib && \
	wget -nv -O lib/schemaspy.jar https://github.com/schemaspy/schemaspy/raw/gh-pages/schemaspy-6.0.0-rc1.jar && \
	wget -nv -O lib/mysql-connector-java.jar http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.42/mysql-connector-java-5.1.42.jar && \
	wget -nv -O lib/sqlite-jdbc.jar http://central.maven.org/maven2/org/xerial/sqlite-jdbc/3.18.0/sqlite-jdbc-3.18.0.jar && \
	apk del wget ca-certificates
CMD [ "sh", "start.sh" ]
