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

Wordpress is a management system focused on the creation of any type of website.

```
sudo apt install wget zip
cd var/www/
sudo wget https://wordpress.org/latest.zip
sudo unzip latest.zip
sudo mv html/ html_old/
sudo mv wordpress/ html/
sudo chmod -R 755 html
```

## Additionnal useful esrvice.

#### LiteSpeed
Litespeed is a proprietary web server software. It's the fourth most popular web server, and is estimated to be used by 10% of websites. 

-> Before installing Litespeed we make sure the system is up to date:
```sudo apt update```
```sudo apt upgrade```

By default, OpenLiteSpeed is avilable on Debian base repository:

```
wget -O http://rpms.litespeedtech.com/debian/enable_lst_debian_repo.sh | sudo bash
```

We connect via ssh:

```ssh apeposhi@localhost -p 4242```




Default password for openlitespeed is 123456. We will change the password to something more secure with the following command:

```
sudo /usr/local/lsws/admin/misc/admpass.sh
```

To configure the firewall to allow connections through ports 8088 and 7080 and add the rules to the port:

```sudo ufw allow 8088/tcp```
```sudo ufw allow 7080/tcp```
```sudo ufw reload```

Once we have completed the previous step we can connect. We will put in the search engine of our browser localhost:7080 and provide our login credentials.

