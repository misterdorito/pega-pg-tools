# pega-pg-tools
A postgresql-tools variant with a few convenience features for folks working with [pega-helm-charts](https://github.com/pegasystems/pega-helm-charts). 

Docker images available at https://hub.docker.com/repository/docker/primedorito/pega_pg_tools.

## Deploying container to a k8s cluster

To deploy this container you can:
```
kubectl -n [namespace] apply -f https://raw.githubusercontent.com/misterdorito/pega-pg-tools/master/k8s/pega-pg-tools-[version].yml
```
[namespace] should be replaced by the k8s namespace your deploying into.
[version] should be replaced with the desired PostgreSQL version -- 9.4, 9.5, 9.6, 11 or 12.

## Using container to query a Postgresql DB:
To query a db:
```
pega-psql.sh
```
This script is on the user's path.

## To undeploy container
To remove the container once you're done with it:
```
kubectl -n <namespace> delete deployment postgresql-tools
```
and also
```
kubectl -n <namespace> delete pvc datadir
```

## Other stuff
This repo extends extends the [postgresql_tools](https://github.com/misterdorito/postgresql_tools) repo -- generally the information there is applicable here. 
