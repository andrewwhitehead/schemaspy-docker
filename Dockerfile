FROM frolvlad/alpine-oraclejdk8:slim
ENV LC_ALL C
RUN apk add --no-cache graphviz ttf-ubuntu-font-family java-postgresql-jdbc
WORKDIR /app/
COPY start.sh conf ./
ADD https://github.com/schemaspy/schemaspy/raw/gh-pages/schemaspy-6.0.0-rc1.jar \
	lib/schemaspy.jar
ADD http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.42/mysql-connector-java-5.1.42.jar \
	lib/mysql-connector-java.jar
ADD http://central.maven.org/maven2/org/xerial/sqlite-jdbc/3.18.0/sqlite-jdbc-3.18.0.jar \
	lib/sqlite-jdbc.jar
VOLUME /app/output
CMD [ "sh", "start.sh" ]
