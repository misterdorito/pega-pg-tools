ARG pg_version
FROM misterdorito/postgresql-tools:${pg_version}

CMD mkdir -p /scripts
ENV PATH=/scripts:$PATH

COPY pega-psql.sh /scripts
CMD chmod +x /scripts/pega-psql.sh
