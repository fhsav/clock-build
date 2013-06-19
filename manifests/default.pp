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

class create_user {
  user { 'ubuntu':
    ensure   => 'present',
    home     => '/home/ubuntu',
    password => '$6$6ZYmUT4g4$50bAkyjiHX7x/kah3dJwj3Jc8/7APLrlz695lNYArc9F5XTC2gZ6FY/r0nIEe7ega2/zIQMUaRwyBc4IcQq96/',
    shell    => '/bin/bash',
  }

  file { '/home/ubuntu':
    ensure => 'directory'
  }
}

class { 'create_user':
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

# git clone rbenv
# add to ~/.profile
# git clone ruby-build
# git clone rbenv-sudo
# rbenv install 2.0.0-p0
# gem install bundler passenger
