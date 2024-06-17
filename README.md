# OracleXE + Harlequine

목적: oracle 설정 template

## Install
**Requirements**
- Docker, Docker-Compose or Podman, Podman-Compose


### Clone
```bash
git clone https://github.com/halfenif/toy_docker_db_oracle_xe.git
```

### Build
```bash
cd toy_docker_db_oracle_xe
./build.sh
```
- docker-compose를 호출합니다
- schema 구성을 위한 docker명령을 echo로 출력합니다.
- **Oracle이 정상적으로 구동 될 때까지 기다려야 합니다.**
- init.sql을 호출해서 DB를 구성합니다.

### Config
- Oracle system password: Dockerfile
- Timezone: Asia/Seoul, Dockerfile
- Port: docker-compose.yaml
- DBMS, User, Password: init.sql
- unixodbc: ./unixODBC/odbcinst.ini


## Feature
- Python 3.9
- Oracle Instant Client, unixODBC

---
If you feel something isn't working right, I recommend clearing Docker's cached images, containers, and volumes, and then trying again.  
뭔가 잘 안된다고 생각되면. Docker의 cache에 해당하는 image, container, volume을 clear하고 해 보는 것을 권합니다.