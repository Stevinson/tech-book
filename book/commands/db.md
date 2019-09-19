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

## Mongo

* `mongo` - open a shell


