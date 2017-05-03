#!/bin/bash

username=$1
hostname=$2


if [ ! $# == 2 ]; then
  echo "Usage: ./create.sh username subdomain_name (./create.sh a.bukreev ab)"
  exit
fi

#Добавляем пользователя
useradd -m -d /home/$1 $1
usermod -g www-data -G $1 $1 
echo "Устанавливаем пароль новому пользователю"
passwd $1
#Создаем папку, назначаем права
mkdir -p /home/$1/www
mkdir -p /home/$1/log
chown $1: /home/$1/www
chown $1: /home/$1/log

#Пишем конфиг апачу
echo "<VirtualHost *:82>
	ServerAdmin webmaster@$2.loc

	ServerName $2.loc
	ServerAlias *.$2.loc

	# This will be the wildcarded document root. Any folder you create in /var/www/test will be automatically a subdomain name.
	VirtualDocumentRoot /home/$1/www/%-3/web
	
	# For symlinking your projects and htaccesses to work
	<Directory />
		Options FollowSymLinks
		AllowOverride All
	</Directory>

	ErrorLog /home/$1/log/vhosts-error.log

	# Possible values include: debug, info, notice, warn, error, crit,
	# alert, emerg.
	LogLevel warn

	<IfModule mod_ruid2.c>
            RUidGid $1 $1
	</IfModule>

	CustomLog /home/$1/log/vhosts-access.log combined
</VirtualHost>" >> /etc/apache2/sites-available/$2.conf

ln -s /etc/apache2/sites-available/$2.conf /etc/apache2/sites-enabled/$2.conf

#Релоудим апач
/etc/init.d/apache2 reload
