$home      = '/home/ubuntu'
$as_ubuntu = 'sudo -u ubuntu -H bash -l -c'

Exec {
  path => ['/usr/sbin', '/usr/bin', '/sbin', '/bin']
}

###
# Pre-install Stage
###

stage { 'preinstall':
  before => Stage['main']
}

class apt_get_update {
  exec { 'apt-get -y update':
    unless => 'test -e ${home}/.rbenv'
  }
}

class { 'apt_get_update':
  stage => preinstall
}
