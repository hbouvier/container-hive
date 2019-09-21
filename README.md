# HIVE

A Standalone Hive container

To run the container

```bash
docker run --name hive -ti -d -p 10000 hbouvier/hive
echo "Wait 30 seconds and run this:"
docker exec -ti hive beeline -u jdbc:hive2://localhost:10000/default "" "" ""
```

Within Hive use the dummy `name` table you have just created

```sql
CREATE EXTERNAL TABLE name (id INT, name STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LOCATION '/app/samples/name';
SELECT * FROM name;
INSERT INTO TABLE name VALUES (4, 'zeus'), (5, 'odin');
SELECT * FROM name ORDER BY id;
