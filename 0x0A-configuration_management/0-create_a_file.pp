# creates a file in the tmp directory
file  { 'school':
  path    =>    '/tmp/school',
  content => 'I love Puppet',
  group   =>   'www-data',
  owner   =>   'www-data',
  mode    =>    '0744'
}
