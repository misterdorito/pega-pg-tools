#!/bin/bash
export DB_HOST=$(echo $JDBC_URL | cut -d: -f3 | cut -d/ -f3)
export DB_NAME=$(echo $JDBC_URL | cut -d/ -f4)
export DB_PORT=$(echo $JDBC_URL | cut -d: -f3)
export DB_PORT=$(echo $JDBC_URL | cut -d: -f4 | cut -d/ -f1)
export DB_USERNAME=$(cat /credentials/DB_USERNAME)
export DB_PASSWORD=$(cat /credentials/DB_PASSWORD)

echo ${DB_HOST}:${DB_PORT}:${DB_NAME}:${DB_USERNAME}:${DB_PASSWORD} > ~/.pgpass
chmod 600 ~/.pgpass

psql -h $DB_HOST -d $DB_NAME -p $DB_PORT -U $DB_USERNAME
