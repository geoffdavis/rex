# Validate the mount options for the remote execution user's homedirectory.
#
# Checks to make sure that the remote user's home directory is not mounted with noexec.
class rex::mntopts (
  $rex_dir = $rex::params::rex_dir,
) inherits rex::params {
  exec { "Check noexec on ${rex_dir}":
    path    => ['/usr/sbin', '/sbin', '/usr/bin', '/bin'],
    command => "findmnt -n -o OPTIONS --target ${rex_dir} | grep noexec",
    returns => 1,
  }
}
