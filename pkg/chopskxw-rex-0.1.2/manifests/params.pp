# If REX user has already been configured, you can override rex_user with the following...
# <%= @host.params['remote_execution_ssh_user'] %>
class rex::params (
  $rex_user = 'root',
  $rex_pw = '!!',
  $rex_grp = 'wheel',
  $rex_pw_max = '99999',
  $rex_pw_min = '0',
  $rex_comment = 'REX user for Satellite/Foreman',
  $resources = {},
) {
}

