#This  assumes that the satellite/foreman settings are configured for the correct
#remote execution user.

class rex::ssh_keys(
  $rex_user  = $rex::params::rex_user,
  $rex_grp   = $rex::params::rex_grp,
  $rex_home   = $rex::params::rex_home,
  $rex_keys  = $rex::params::rex_keys
) {
  file { "$rex_home/.ssh":
    ensure  => directory,
    mode    => '0700',
    owner   => $rex_user,
    group   => $rex_grp,
  } ->
  file { "$rex_home/.ssh/authorized_keys":
    ensure  => file,
    mode    => '0600',
    owner   => $rex_user,
    group   => $rex_grp,
    content => template('rex/rex_keys.erb'),
  }
}
