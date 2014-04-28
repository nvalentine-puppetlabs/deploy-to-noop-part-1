class site::profile::pe::master() {
  require ::site::profile::pe
  require ::site::profile::base

  File { owner => 'root', group => 'root', mode => '0644', }

  file { 'PE environment dir':
    ensure => directory, 
    path => '/etc/puppetlabs/puppet/environments',
  }

  file { 'PE production environment dir':
    ensure => directory,
    path => '/etc/puppetlabs/puppet/environments/production',
  }

  file { 'PE module dir':
    ensure => link,
    path => '/etc/puppetlabs/puppet/environments/production/modules',
    target => '/vagrant/puppet/environments/production/modules',
  }

  file { 'PE manifests dir':
    ensure => link,
    path => '/etc/puppetlabs/puppet/environments/production/manifests',
    target => '/vagrant/puppet/environments/production/manifests',    
  }

  file { 'PE data dir':
    ensure => link,
    path => '/etc/puppetlabs/puppet/environments/production/data',
    target => '/vagrant/puppet/environments/production/data',
  }

  file { 'PE hiera data':
    ensure => link,
    path => '/etc/puppetlabs/puppet/hiera.yaml',
    target => '/etc/puppetlabs/puppet/environments/production/hiera.yaml',
  }

  file { 'PE hiera config from Vagrant':
    ensure => link,
    path => '/etc/puppetlabs/puppet/environments/production/hiera.yaml',
    target => '/vagrant/puppet/environments/production/hiera.yaml',
  }
 
  ini_setting { 'PE module path':
    ensure => present,
    path => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'main',
    setting => 'modulepath',
    value => '/etc/puppetlabs/puppet/environments/production/modules:/opt/puppet/share/puppet/modules',
  }

  ini_setting { 'PE manifest path':
    ensure => present,
    path => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'main',
    setting => 'manifest',
    value => '/etc/puppetlabs/puppet/environments/production/manifests/site.pp',
  }
  
  Service <| title == 'pe-httpd' |> { subscribe => File['PE hiera data'], }

  # hack because we aren't monitoring hiera.yaml; just the symlink
  exec { '/usr/sbin/service pe-httpd restart': }
}
