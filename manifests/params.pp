# If REX user has already been configured, you can override rex_user with the following...
# <%= @host.params['remote_execution_ssh_user'] %>
class rex::params (
  String $rex_user = 'root',
  String $rex_pw = '!!',
  String $rex_grp = 'wheel',
  Stdlib::Absolutepath $rex_home = $rex_user == 'root' ? {
    true => '/root',
    default => "/home/${rex_user}",
  },
  Variant[Integer,String] $rex_pw_max = '99999',
  Variant[Integer,String] $rex_pw_min = '0',
  String $rex_comment = 'REX user for Satellite/Foreman',
  Variant[Array, Struct] $rex_keys = [],
  Stdlib::Absolutepath $rex_dir = '/var/tmp',
) {
  include stdlib
}

