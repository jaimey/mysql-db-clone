# mysql-db-clone v1.1
This script clones one mysql database to another and  send a notice on a Telegram channel at the end.

Change this parameters:

### MySQL
```sh
MYSQL_UNAME=root
MYSQL_PWORD=2

MYSQL_DBSOURCE=crm7
MYSQL_DBDESTINATION=crm7pruebas
```
### Telegram
```sh
BOT_TOKEN=
CHANNEL=
```
## Run


```sh
./dbclone.sh
```
