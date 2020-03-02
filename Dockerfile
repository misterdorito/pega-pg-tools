ARG pg_version
FROM misterdorito/dorito:${DOCKER_TAG}

CMD mkdir -p /scripts
ENV PATH=/scripts:$PATH

COPY pega-psql.sh /scripts
CMD chmod +x /scripts/pega-psql.sh
