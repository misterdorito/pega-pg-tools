ARG pg_version
FROM primedorito/postgresql_tools:${pg_version}

RUN mkdir -p /scripts
ENV PATH=/scripts:$PATH

COPY pega-psql.sh /scripts/
RUN chmod +x /scripts/pega-psql.sh

ENTRYPOINT ["tail", "-f", "/dev/null"]
