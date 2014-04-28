class site::profile::base(
  $ntp_servers = 'pool.ntp.org',
  $ssh_authorized_keys = {},
  $sudo_rules = {},  
  $ops_users = {},
  $ops_group = 'ops'
) {

  validate_string($ntp_servers)
  validate_hash($ssh_authorized_keys)
  validate_hash($sudo_rules)
  validate_hash($ops_users)
  validate_string($ops_group)

  require ::site::profile

  require ::ntp

#  class { 'sudo': purge => true, config_file_replace => true, }
#  $sudo_rules_defaults = {}
#  create_resources('sudo::conf', $sudo_rules, $sudo_rules_defaults)

  $ssh_auth_keys_defaults = {}
  create_resources('ssh_authorized_key', $ssh_authorized_keys, $ssh_auth_keys_defaults)

  $ops_users_defaults = { managehome => true, }
  create_resources('user', $ops_users, $ops_users_defaults)

  group { $ops_group: ensure => present, }
}
