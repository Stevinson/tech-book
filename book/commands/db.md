# Database Commands

## Postgres

* `psql` - open a shell

* `\ds` - list all the users and their priverledges

* `\l` - shows all databases and their owners

```
dropdb <db_name>
createdb <db_name>
```

```
CREATE USER eigenuser PASSWORD '1234';

CREATE DATABASE mvp;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO eigenuser;
ALTER ROLE eigenuser IN DATABASE mvp SET search_path = mvp,public;
GRANT ALL PRIVILEGES ON DATABASE mvp TO eigenuser;
```

* `ps aux | grep 'postgres *-D'` - find the path to the postgres config files


```
tar -xvzf /path/to/20200324.tar.gz
cd backups/postgres/20200324/
dropdb eigendb --username eigenuser && createdb eigendb --username eigenuser && psql --file eigendb eigendb --username eigenuser
cd ../../mongo/20200324/
mongo eigendb --eval 'db.dropDatabase()' && mongorestore --db eigendb eigendb
```

```
mkdir -p ~/<PATH_TO_REPO>/upside_analytics/analytics/tests/fixtures/db_dumps/$(date +%Y%m%d)/
pg_dump --verbose --host localhost --port 5432 --username upside  upside_dev --file <PATH_TO_REPO>/upside_analytics/analytics/tests/fixtures/db_dumps/$(date +%Y%m%d)/snap_001
createdb upside_db_snap_001 --username upside && psql --file snap_001 upside_db_snap_001 --username upside
```

## Mongo

* `mongo` - open a shell


