# configures nginx on a server
$config = "server {
  listen 80 default_server;
  listen [::]:80 default_server;
  
  root /var/www/html;
  index index.html;
  add_header X-Served-By \$hostname;
}
"
package { 'nginx':
  ensure => 'installed',
}

file { 'index.html':
  ensure  => 'present',
  path    => '/var/www/html/index.html',
  content => 'Hello World!',
  mode    => '0644'
}

file { 'server_config':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  content => $config
}

exec { 'service nginx restart':
  path => ['/usr/sbin', '/usr/bin']
}
