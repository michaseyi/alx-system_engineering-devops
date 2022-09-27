# configures nginx on a server
exec { 'setup_nginx':
  command => 'apt-get -y update; apt-get -y install nginx;
  sudo sed -i "/server {/a add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default;
  service nginx restart',
  path    => ['/usr/sbin/', '/usr/bin'],
}
