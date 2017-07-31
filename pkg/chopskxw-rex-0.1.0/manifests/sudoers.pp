class rex::sudoers (
  $res_user	= $rex::params::rex_user,
  $rex_sudo	= '/etc/sudoers.d/rex') inherits rex::params {
  file { $rex_sudo ]:
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    content => template('rex/rex_sudoers.erb'),
  }
}

