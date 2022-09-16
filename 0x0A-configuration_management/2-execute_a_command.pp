# kills a running process
exec { 'pkill killmenow':
  path => ['/usr/bin']
}