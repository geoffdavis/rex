class rex::mntopts (
  $rex_dir = $rex::params::rex_dir,
  ) inherits rex::params {
    exec { "/usr/bin/findmnt -n -o OPTIONS --target ${rex_dir} | grep noexec":
      returns => 1,
    }
}
