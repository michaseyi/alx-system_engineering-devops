# configures nginx on a server
package { 'nginx':
  ensure => 'installed',
}

exec { 'server_config':
  command => 'sed -i "/listen 80 default_server;/a add_header X-Served-By $hostname;" /etc/nginx/sites-available/default',
  path    => ['/usr/sbin', '/usr/bin']
}

exec { 'service nginx restart':
  path => ['/usr/sbin', '/usr/bin']
}
