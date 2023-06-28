# SQL50

## To install and set up a MySQL database on Linux

```bash
sudo apt-get install mysql-server -y
```

## Start and enable the server

```bash
sudo systemctl enable --now mysql
```

## Secure Installation

```bash
sudo mysql_secure_installation
```

## Log in to the MySQL console

```bash
sudo mysql -u root -p
```

## Change policy level if needed

```bash
SET GLOBAL validate_password.length = 4;
SET GLOBAL validate_password.number_count = 0;
```

## Create the database

```bash
CREATE DATABASE sql50;
```

## Create user

```bash
CREATE USER 'sql50'@'localhost' IDENTIFIED BY 'PASSWORD';
GRANT ALL ON sql50.* To 'sql50'@'localhost' WITH GRANT OPTION;
```

## How to use

Use SQLTools and SQLTools MySQL extensions.

Run schema.sql for each problem and the solution itself.
