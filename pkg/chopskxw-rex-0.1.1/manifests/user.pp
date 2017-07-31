class rex::user (
  $rex_user	= $rex::params::rex_user,
  $rex_pw 	= $rex::params::rex_pw,
  $rex_grp	= $rex::params::rex_grp
  $rex_pw_max	= $rex::params::rex_pw_max,
  $rex_pw_min	= $rex::params::rex_pw_min,
  $rex_comment	= $rex::params::rex_comment) inherits rex::params {
    user {$rex_user:
      ensure		=> 'present',
      groups		=> [$rex_grp],
      managehome	=> true,
      password		=> $rex_pw,
      password_max_age	=> $rex_pw_max,
      password_min_age 	=> $rex_pw_min,
      comment	    	=> $rex_comment,
    }
}

