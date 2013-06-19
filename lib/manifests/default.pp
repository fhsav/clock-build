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


###
# Preliminary dependencies
##

package { ['build-essential', 'make', 'bison', 'openssl', 'libreadline5', 'curl', 'libcurl4-gnutls-dev', 'libssl-dev', 'libxml2-dev', 'libreadline6-dev', 'libyaml-dev', 'zlib1g-dev', 'libsasl2-dev']:
  ensure => installed;
}


###
# Databases 'n such
###

package { ['mongodb', 'redis-server', 'memcached', 'nodejs']:
  ensure => installed;
}


###
# Ruby
###

rbenv::install { 'ubuntu':
  group => 'ubuntu',
  home  => '/home/ubuntu'
}

rbenv::plugin { 'rbenv-sudo':
  user   => 'ubuntu',
  source => 'https://github.com/dcarley/rbenv-sudo.git'
}

rbenv::compile { '2.0.0-p0':
  user   => 'ubuntu',
  home   => '/home/ubuntu',
  global => true
}
