#!/usr/bin/env bash
 
# BEGIN ########################################################################
echo -e "-- ----------------- --\n"
echo -e "-- BEGIN ${HOSTNAME} --\n"
echo -e "-- ----------------- --\n"
 
# VARIABLES ####################################################################
echo -e "-- Setting global variables\n"
APACHE_CONFIG=/etc/apache2/apache2.conf
LOCALHOST=localhost
 
# BOX ##########################################################################
echo -e "-- Updating packages list\n"
apt-get update -y -qq
 
# APACHE #######################################################################
echo -e "-- Installing Apache web server\n"
apt-get install -y apache2 > /dev/null 2>&1
 
echo -e "-- Adding ServerName to Apache config\n"
grep -q "ServerName ${LOCALHOST}" "${APACHE_CONFIG}" || echo "ServerName ${LOCALHOST}" >> "${APACHE_CONFIG}"
 
echo -e "-- Restarting Apache web server\n"
service apache2 restart
 
# TEST #########################################################################
echo -e "-- Creating a dummy index.html file\n"
cat > /var/www/html/index.html <<EOD
<html>
<head>
<title>${HOSTNAME}</title>
</head>
<body>
<h1>${HOSTNAME}</h1>
<p>Hi sir, I am going to serve you today!</p>
</body>
</html>
EOD
 
# END ##########################################################################
echo -e "-- -------------- --"
echo -e "-- END ${HOSTNAME} --"
echo -e "-- -------------- --"