FROM postgis/postgis:13-3.5

RUN sed -i 's|apt.postgresql.org|apt-archive.postgresql.org|g' /etc/apt/sources.list.d/pgdg.list

RUN apt-get update && apt-get install -y \
    less \
    make

WORKDIR /tmp/db

RUN mkdir /data && chown postgres /data

COPY schema.sql /docker-entrypoint-initdb.d/01.sql
