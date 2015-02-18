class atheme::configure {

  file { "${::atheme::install_dir}/etc/atheme.conf":
    ensure  => file,
    owner   => $::atheme::user,
    group   => $::atheme::group,
    mode    => '0644',
    content => template("${module_name}/atheme.conf.erb"),
  }

}
