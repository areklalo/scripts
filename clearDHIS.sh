DUMP_URL=/home/user/scripts/files/dhis2_clean_demo_28_06_2018.sql
docker cp $DUMP_URL fr-db_demo:/dump.sql
docker stop ohie-fr-demo

docker exec fr-db_demo psql -Udhis dhis2 -c "CREATE DATABASE temp_db"
docker exec fr-db_demo psql -Udhis temp_db -c "DROP DATABASE dhis2"
docker exec fr-db_demo psql -Udhis temp_db -c "CREATE DATABASE dhis2"
docker exec fr-db_demo psql -Udhis dhis2 -f /dump.sql

/home/user/scripts/startDemo.sh

