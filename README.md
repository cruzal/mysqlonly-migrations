# mysqlonly-migrations
Simplest possible tool to make MySQL schema migrations. Only one SQL file required.

## Adding migrations
Migrations will be executed sequentially

Just add line at the end of the file
```sql
CALL migratedb('2018-10-05 00:00:00 Sample migration', 'SELECT 1');
```

First parameter stands for unique migration identifier and will be ran only once per database. Second one is SQL query you want to run.

## Running migrations
```console 
  mysql db_name < migrate.sql
```