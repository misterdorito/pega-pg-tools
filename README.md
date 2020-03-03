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
>kubectl -n [namespace] get pods -l app=postgresql-tools -o custom-columns=CONTAINER:.metadata.name --no-headers=true
postgresql-tools-65876f6cbb-j56gm

>kubectl -n [namespace] exec -it postgresql-tools-65876f6cbb-j56gm /bin/bash
root@postgresql-tools-65876f6cbb-j56gm:/# pega-psql.sh
psql (9.6.16, server 9.6.11)
SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
Type "help" for help.

dbname=> \dn
     List of schemas
     Name      |  Owner
---------------+----------
 data          | dbuser
 rules         | dbuser
 public        | dbuser
(3 rows)

dbname=>
```
The pega-psql.sh script is on the user's path.

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
