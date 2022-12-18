(skipped the LVM partitions so that I don't have to do it all over again).

## Setting up a functional WordPress site with lighttpd, MariaDB and PHP.

#### Lighttpd

Lighttpd is a web server designed to be fast, secure, flexible and true to standarts. It is optimized for environments where speed is very imoprtant. This is because it consumes less CPU and RAM than other servers.

To install:
```sudo apt install lighttpd```

We allow port 80 on ufw fireawall with the following command:

```
sudo ufw allow 80
```

#### MariaDB

MariaDB is a database used for various purposes such as data warehousing, e-commerce, entreprise-level functions and logging applications.

To install: ```sudo apt install mariadb-server```

The default configuration leave MariaDB unsecure. To restrict access to the server and to remove unused accounts we run the following script:
```sudo mysql_secure_installation```
- and then follow the steps :)

#### PHPMyAdmin

PHPMyAdmin is a web applicaiton used to manage databases in a simple way and with a friendly interface.

```
sudo apt install php-cgi php-mysql phpmyadmin
```

#### Wordpress