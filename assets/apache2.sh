#!/bin/sh
set -e

CONFIG_INC=/var/www/html/ssp/conf/config.inc.php
# ldap server info
sed -i "s#{LDAP_URL}#${LDAP_URL}#g" ${CONFIG_INC}
sed -i "s/{LDAP_BINDDN}/${LDAP_BINDDN}/g" ${CONFIG_INC}
sed -i "s/{LDAP_BINDPW}/${LDAP_BINDPW}/g" ${CONFIG_INC}
sed -i "s/{LDAP_BASE}/${LDAP_BASE}/g" ${CONFIG_INC}
# ltb configuration file info
sed -i "s/{PWD_MIN_LENGTH}/${PWD_MIN_LENGTH}/g" ${CONFIG_INC}
sed -i "s/{PWD_MAX_LENGTH}/${PWD_MAX_LENGTH}/g" ${CONFIG_INC}
sed -i "s/{PWD_MIN_LOWER}/${PWD_MIN_LOWER}/g" ${CONFIG_INC}
sed -i "s/{PWD_MIN_UPPER}/${PWD_MIN_UPPER}/g" ${CONFIG_INC}
sed -i "s/{PWD_MIN_DIGIT}/${PWD_MIN_DIGIT}/g" ${CONFIG_INC}
sed -i "s/{PWD_MIN_SPECIAL}/${PWD_MIN_SPECIAL}/g" ${CONFIG_INC}
sed -i "s/{PWD_SPECIAL_CHARS}/${PWD_SPECIAL_CHARS}/g" ${CONFIG_INC}
sed -i "s/{MAIL_FROM}/${MAIL_FROM}/g" ${CONFIG_INC}
if [ "${NOTIFY_ON_CHANGE}"x = "true"x ]; then
    sed -i "s/{NOTIFY_ON_CHANGE}/${NOTIFY_ON_CHANGE}/g" ${CONFIG_INC}
else
    sed -i "s/{NOTIFY_ON_CHANGE}/false/g" ${CONFIG_INC}
fi
if [ "${SMTP_AUTH}"x = "false"x ]; then
    sed -i "s/{SMTP_AUTH}/${SMTP_AUTH}/g" ${CONFIG_INC}
else
    sed -i "s/{SMTP_AUTH}/true/g" ${CONFIG_INC}
fi
sed -i "s/{SMTP_HOST}/${SMTP_HOST}/g" ${CONFIG_INC}
sed -i "s/{SMTP_USER}/${SMTP_USER}/g" ${CONFIG_INC}
sed -i "s/{SMTP_PASS}/${SMTP_PASS}/g" ${CONFIG_INC}
# start apache
exec /usr/sbin/apache2ctl -D FOREGROUND
