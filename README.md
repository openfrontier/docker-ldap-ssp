# docker-ldap-ssp

 This docker is for users to modify ldap password.
 This image is based on the [Self Service Password](https://github.com/ltb-project/self-service-password) system.

## Version
 Current Version: Self Service Password 1.2

## Quick Start
  1. Launch the ssp container

```bash
docker run --name ssp -d -p 80:80 openfrontier/ldap-ssp
docker cp ssp:/var/www/html/ssp/conf/config.inc.php ./config.inc.local.php
vi ./config.inc.local.php
docker cp ./config.inc.local.php ssp:/var/www/html/ssp/conf/config.inc.local.php
```

  2. Open your browser to `http://localhost/ssp`

## Shell Access

For debugging and maintenance purposes you may want access the containers shell.

```bash
docker exec -it ssp bash
```

# References
    * https://hub.docker.com/_/php/
    * https://github.com/ltb-project/self-service-password
    * http://ltb-project.org/wiki/documentation/self-service-password
