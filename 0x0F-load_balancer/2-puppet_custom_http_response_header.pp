# configures nginx on a server
$config = 'server {
  listen 80 default_server;
  listen [::]:80 default_server;
  
  root /var/www/html;
  index index.html index.htm index.nginx-debian.html;
  add_header X-Served-By $hostname;
}
'
package { 'nginx':
  ensure => 'installed',
}

file { 'server_config':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  content => $config
}

exec { 'service nginx restart':
  path => ['/usr/sbin', '/usr/bin']
}
