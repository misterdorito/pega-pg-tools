ARG pg_version
FROM primedorito/postgresql_tools:${pg_version}

CMD mkdir -p /scripts
ENV PATH=/scripts/:$PATH

COPY pega-psql.sh /scripts/
CMD chmod 777 /scripts/pega-psql.sh

