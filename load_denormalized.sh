#!/bin/sh

unzip -p "$1" | \
    sed 's/\\u0000//g' | \
    psql 'postgresql://postgres:pass@localhost:1973/postgres' \
    -v ON_ERROR_STOP=1 \
    -c "COPY tweets_jsonb (data) FROM STDIN WITH (FORMAT csv, DELIMITER E'\x01', QUOTE E'\x02');"
