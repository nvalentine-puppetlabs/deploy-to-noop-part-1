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
    ensure => file,
    path => '/etc/puppetlabs/puppet/hiera.yaml',
    source => "puppet:///${module_name}/pe/master/hiera.yaml",
  }

  Service <| title == 'pe-httpd' |> { subscribe => File['PE hiera data'], }
}
