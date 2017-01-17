# docker-ldap-ssp

 This docker is for users to modify ldap password.
 This image is based on the [Self Service Password](https://github.com/ltb-project/self-service-password) system.

## Version
 Current Version: Self Service Password 1.0

## Quick Start
  1. Launch the ssp container

```bash
docker run -d -p 80:80 openfrontier/docker-ldap-ssp
```

  2. Open your browser to `http://localhost/ssp`

## Available Configuration Parameters

*This will save you from writing a potentially long docker run command.*

Below is the complete list of parameters that can be set using environment variables.

- **LDAP_URL**: The service url for ldap. Defaults to `ldap://ldap:389`
- **LDAP_BINDDN**: The administrator of the ldap service. Defaults to `cn=admin,dc=example,dc=com`
- **LDAP_BINDPW**: The administrator password for the ldap service. Defaults to `changeme`
- **LDAP_BASE**: The base dn for the ldap service. Defaults to `dc=example,dc=com`
- **PWD_MIN_LENGTH**: The user sets the minimum length of the password. Defaults to `0`
- **PWD_MAX_LENGTH**: The user sets the maximum length of the password. Defaults to `0`
- **PWD_MIN_LOWER**: The user-defined password contains a minimum of lower characters. Defaults to `0`
- **PWD_MIN_UPPER**: The user-defined password contains a minimum of upper characters. Defaults to `0`
- **PWD_MIN_DIGIT**: The user-defined password contains a minimum of digit characters. Defaults to `0`
- **PWD_MIN_SPECIAL**: The user-defined password contains a minimum of special characters. Defaults to `0`
- **PWD_SPECIAL_CHARS**: User-defined special characters. Defaults to `^a-zA-Z0-9`
- **MAIL_FROM**: Retrieve the sender address of the password function. Defaults to `admin@example.com`
- **NOTIFY_ON_CHANGE**: Notify users anytime their password is changed. Defaults to `false`
- **SMTP_HOST**: SMTP server hostname. Defaults to `localhost`
- **SMTP_USER**: SMTP server username. Defaults to `smtpuser`
- **SMTP_PASS**: SMTP server password of username. Defaults to `smtppass`
  
## Shell Access

For debugging and maintenance purposes you may want access the containers shell.

```bash
docker exec -it openfrontier/docker-ldap-ssp bash
```

# References
    * https://hub.docker.com/_/php/
    * https://github.com/ltb-project/self-service-password
    * http://ltb-project.org/wiki/documentation/self-service-password
