# Class: rex
# ===========================
#
# This module will configure a system for remote execution from Satellite 6/Foreman. It
# will alos deploy and manage the REX user if not root.
#
# Parameters: see params and execptions
class rex (
  $rex_user = $rex::params::rex_user,
  ) inherits rex::params {
    if $rex_user != root {
      include rex::user
    }

  include rex::sudoers
  include rex::ssh_keys
  include rex::mntopts

}
