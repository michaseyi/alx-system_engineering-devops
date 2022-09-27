# configures nginx on a server
package { 'nginx':
  ensure => 'installed',
}

exec { 'server_config':
  command  => 'sudo sed -i "/listen 80 default_server;/a add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default;
  service nginx restart',
  provider => shell,
}

