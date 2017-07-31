class satusers (
  $rex_user	= $rex::params::rex_user,
  $rex_pw 	= undef,
  $rex_grp	= $rex::params::rex_grp
  $rex_pw_max	= $rex::params::rex_pw_max,
  $rex_pw_min	= $rex::params::rex_pw_min,
  $rex_comment	= $rex::params::rex_comment) inherits rex::params {
    user {$rex_user:
      ensure		=> 'present',
      groups		=> [$rex_grp],
      home		=> '/home/$rex_usr',
      managehome	=> true,
      password		=> $example_pw,
      password_max_age	=> $rex_pw_max,
      password_min_age 	=> $rex_pw_min,
      comment	    	=> '$rex_comment',
    }
}

