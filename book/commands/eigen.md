# Eigen Commands

## Access Database of QA servers

```
ssh -i peng_eigen.pem ubuntu@qa6.eigen.tech
cd docker_deployment/
docker exec -it eigen-webapp bash
python manage.py shell_plus
docs = Document.objects.filter()
docs.values()
```

## Access Mongo Databases

```
docker exec -it eigen-mongo mongo
mongo
show dbs
use eigendb
show collections
db.original.files.find({}).pretty()
```
