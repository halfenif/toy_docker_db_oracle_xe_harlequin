docker kill toy_docker_db_oracle_xe
docker containter rm toy_docker_db_oracle_xe
docker image rm toy_docker_db_oracle_xe

#sudo rm -rf ./oradata

DOCKER_BUILDKIT=1 docker build --no-cache --tag toy_docker_db_oracle_xe .
# DOCKER_BUILDKIT=1 docker build --tag toy_docker_db_oracle_xe .

docker image ls

docker-compose up --detach
# docker-compose up

echo ------------------------------------------
echo 1. init SQL
echo docker exec -it toy_docker_db_oracle_xe sqlplus sys/manager@//localhost:1521/XE as sysdba @/docker-entrypoint-initdb.d/init.sql
echo docker exec -it toy_docker_db_oracle_xe /bin/bash
echo 2. run harlequin
echo /app/harlequin.sh
echo 3. Good luck!
echo ------------------------------------------

# docker inspect  -f '{{.State.Status}}' toy_docker_db_oracle_xe
# docker inspect  -f '{{.State.Running}}' toy_docker_db_oracle_xe