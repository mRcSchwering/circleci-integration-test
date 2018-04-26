# circleci-integration-test

**start docker-git-alpine container mounting docker socket and pwd**

```
sudo docker run --rm -it \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$PWD":/home \
  docker:18.03.0-ce-git sh
```

**get docker-compose (unfortunately only with pip)**

```
apk --update add py2-pip
pip install docker-compose
```

**start server and client (docker-in-docker)**

```
cd home
docker-compose up -d
docker-compose ps
```

**tell client to talk to server**

```
docker-compose run client \
  psql -h server -p 5432 -U postgres -c "\l"
```
Out:
```
Starting home_server_1 ... done
                                 List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges
-----------+----------+----------+------------+------------+-----------------------
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
(3 rows)
```
