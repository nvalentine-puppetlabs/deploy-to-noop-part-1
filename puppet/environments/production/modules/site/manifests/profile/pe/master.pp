class site::profile::pe::master() {
  require ::site::profile::pe
  require ::site::profile::base

  File { owner => 'root', group => 'root', mode => '0644', }

  file { 'PE hiera data':
    ensure => link,
    path => '/etc/puppetlabs/puppet/hiera.yaml',
    target => '/etc/puppetlabs/puppet/environments/production/hiera.yaml',
  }

  Service <| title == 'pe-puppetserver' |> { subscribe => File['PE hiera data'], }
}
