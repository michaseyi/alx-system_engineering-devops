# configures nginx on a server

exec { 'install_nginx':
  command  => 'apt-get -y update; apt-get -y install nginx;',
  provider => shell
}

exec { 'nginx_config':
  command  => 'sudo sed -i "/listen 80 default_server;/a add_header X-Served-By \$hostname;" /etc/nginx/sites-available/default;',
  provider => shell
}

exec { 'restart_nginx':
  command  => 'service nginx restart',
  provider => shell
}

#exec { 'command':
#  command  => 'apt-get -y update;
#  apt-get -y install nginx;
#  sudo sed -i "/listen 80 default_server;/a add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default;
#  service nginx restart',
#  provider => shell,
#}
