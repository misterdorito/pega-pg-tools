ARG pg_version
FROM misterdorito/dorito:${pg_version}

CMD mkdir -p /scripts
ENV PATH=/scripts:$PATH

COPY pega-psql.sh /scripts
CHMOD +x /scripts/pega-psql.sh
