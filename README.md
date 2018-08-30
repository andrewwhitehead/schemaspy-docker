# schemaspy-docker

Quickly run SchemaSpy on a MySQL, Postgres or SQLite3 database in order
to generate a browsable visualization of the tables, columns, and relationships.

Based on `frolvlad/alpine-oraclejdk8:slim`. After running SchemaSpy to produce the
HTML content, the results are served by busybox httpd.

SchemaSpy is available at: https://github.com/schemaspy/schemaspy

See also: https://github.com/bcgov/schemaspy

This repo is a clone from: https://github.com/cywolf/schemaspy-docker/

With a fix in master for httpd failing to start: https://github.com/cywolf/schemaspy-docker/pull/3

## Sample Docker build command

```
docker build -t quiqupltd/schemaspy https://github.com/quiqupltd/schemaspy-docker.git
```

## Sample Postgres Usage

```
docker run -ti --rm --name schemaspy \
	-p 8080:8080 \
	-e DATABASE_TYPE=pgsql \
	-e DATABASE_HOST=postgres \
	-e DATABASE_NAME=mydatabase \
	-e DATABASE_USER=postgres \
	-e DATABASE_PASSWORD=mysecretpassword \
	--link postgres \
	schemaspy
```

## Environment variables

`DATABASE_TYPE`: One of `mysql`, `pgsql`, or `sqlite`. Other database types are
	supported by SchemaSpy, but their JDBC connector libraries are not currently
	included.

`DATABASE_HOST`: The hostname of the database server, likely the name of
	another Docker container which has been linked to this one.

`DATABASE_NAME`: The name of the target database.

`DATABASE_USER`, `DATABASE_PASSWORD`: The username and password used to establish
	the database connection.


## Building

We can build this image locally and push to db-graph repo which uses it in deployments :

* `docker build --tag registry.quiqup.com/backend/db-graph:schemaspy .`
* `docker push registry.quiqup.com/backend/db-graph:schemaspy`
