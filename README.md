Seafile-Docker
--------------------
Seafile is Next-generation Open Source Cloud Storage -> www.seafile.com

This is Seafile packaged for docker.

For the present solution you need an external Mysql Website. Following are instructions to have another container with Mysql linked to the web application.

The mysql container is orchardup/mysql -> https://index.docker.io/u/orchardup/mysql/

For creating the database use:

    docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=yoursecret -e MYSQL_DATABASE=openproject -e MYSQL_USER=openproject --name mysql orchardup/mysql

First time initialization:

    docker run -i -t --dns=127.0.0.1 --link mysql:db --name seafile alvistar/seafile /sbin/my_init -- bootstrap

Now run:

    docker run -d -t --dns=127.0.0.1 -p 10001:1001 -p 8082:8082 -p 12001:12001 -p 8000:8000 --volumes-from seafile --link mysql:db alvistar/seafile

If you want to access with ssh and insecure-key:

    docker run -d -t --dns=127.0.0.1 -p 10001:1001 -p 8082:8082 -p 12001:12001 -p 8000:8000 --volumes-from seafile --link mysql:db alvistar/seafile /sbin/my_init --enable-insecure-key