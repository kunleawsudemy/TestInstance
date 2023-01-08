#!/bin/bash

sudo yum update -y

#install datadog agent
DD_AGENT_MAJOR_VERSION=7 DD_API_KEY=${Datadog_API_Key} DD_SITE="datadoghq.com" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"

#Install SSM
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm

sudo systemctl status amazon-ssm-agent
sudo amazon-linux-extras install php8.0 mariadb10.5
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd



# New Line added 11/18/2022
#LAMP Server Documentation: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/install-LAMP.html

# #Update the server
# sudo yum update -y

# #Download package for LAMP Server
# sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
# sudo yum install -y httpd mariadb-server

# #Start and Enable Apache
# sudo systemctl enable httpd
# sudo systemctl start httpd

# #Add ec2-user to apache group
# sudo usermod -a -G apache ec2-user

# #Change /var/www directory ownership
# sudo chown -R ec2-user:apache /var/www
# sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;

# #Add group write permission
# find /var/www -type f -exec sudo chmod 0664 {} \;

# #Create a PHP file in Apache
# echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php

# #Change directory to /var/www/html
# cd /var/www/html/

# #Start and Enable Mariadb
# sudo systemctl enable mariadb
# sudo systemctl start mariadb

# #rm /var/www/html/phpinfo.php

# #Secure Mariadb
# sudo mysql_secure_installation <<EOF

# y
# abcd1234!!
# abcd1234!!
# y
# y
# y
# y
# EOF

# #Install phpMyAdmin
# sudo yum install php-mbstring -y

# #Restart Apache and php-fpm
# sudo systemctl restart httpd
# sudo systemctl restart php-fpm

# cd /var/www/html

# #Get latest phpmyadmin download from this link
# sudo wget https://files.phpmyadmin.net/phpMyAdmin/5.2.0/phpMyAdmin-5.2.0-all-languages.tar.gz -P /var/www/html/
# cd /var/www/html/ && sudo mkdir phpMyAdmin
# sudo tar -xvzf phpMyAdmin-5.2.0-all-languages.tar.gz -C phpMyAdmin --strip-components 1

# #Enable and start MariaDB
# sudo systemctl enable mariadb
# sudo systemctl start mariadb

# #Install wordpress
# wget https://wordpress.org/latest.tar.gz
# tar -xzf latest.tar.gz

# sudo systemctl restart mariadb

# #Create Database, Database-User and Grant Permission
# mysql -uroot -pabcd1234!! -e "CREATE DATABASE wordpress_db;"
# mysql -uroot -pabcd1234!! -e "CREATE USER 'db_user'@'localhost' IDENTIFIED BY 'abcd1234!!';"
# mysql -uroot -pabcd1234!! -e "GRANT ALL PRIVILEGES ON wordpress_db.* TO "db_user"@"localhost";"
# mysql -uroot -pabcd1234!! -e "FLUSH PRIVILEGES;"

# #Copy wp-config.php file
# cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

# #Search and replace
# sudo sed -i 's/database_name_here/wordpress_db/g' /var/www/html/wordpress/wp-config.php
# sudo sed -i 's/username_here/db_user/g' /var/www/html/wordpress/wp-config.php
# sudo sed -i 's/password_here/abcd1234!!/g' /var/www/html/wordpress/wp-config.php

# #Comment certain line
# #https://api.wordpress.org/secret-key/1.1/salt/
# sudo sed -i '51,58 s/^/#/' /var/www/html/wordpress/wp-config.php

# #Copy wordpress directory recursively to /var/www/html directory
# sudo cp -r wordpress/* /var/www/html/

# #Make blog directory uncer /var/www/html
# #sudo mkdir /var/www/html/blog
# #sudo cp -r wordpress/* /var/www/html/blog/

# #Change AllowOverride None to AllowOverride All
# sudo sed -i 's/AllowOverride None/AllowOverride All/g' /etc/httpd/conf/httpd.conf
# sudo sed -i 's/AllowOverride none/AllowOverride All/g' /etc/httpd/conf/httpd.conf

# #Set Permission for apache on /var/www
# sudo chown -R apache /var/www
# sudo chgrp -R apache /var/www
# sudo chmod 2775 /var/www

# find /var/www -type d -exec sudo chmod 2775 {} \;
# find /var/www -type f -exec sudo chmod 0664 {} \;

# #Restart Apache and MariaDB
# sudo systemctl restart httpd
# sudo systemctl restart mariadb

# #Download wp-cli
# sudo wget -P /var/www/html/ "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
# sudo wget -P /var/www/html/ "https://downloads.wordpress.org/theme/twentyseventeen.2.9.zip"
# sudo unzip /var/www/html/twentyseventeen.2.9.zip
# sudo chmod +x /var/www/html/wp-cli.phar
# sudo mv /var/www/html/wp-cli.phar /usr/local/bin/wp
# #wp theme activate twentyseventeen

# #wp theme install twentyseventeen --activate
# #secure your wordpress site (https://api.wordpress.org/secret-key/1.1/salt/)

# #Enabling jemalloc for MySQL and restart MariaDB
# sudo yum install jemalloc -y
# sudo systemctl restart mariadb
