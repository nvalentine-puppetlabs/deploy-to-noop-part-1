class site::profile::pe::agent(
  $environment = 'production',
) {
  validate_string($environment)

  require ::site::profile::pe
  require ::site::profile::base

  Ini_settings { ensure => present, path => '/etc/puppetlabs/puppet/puppet.conf', }

  ini_setting { 'PE agent environment setting':
    section => 'agent',
    setting => 'environment',
    value => $environment,
  }
}
