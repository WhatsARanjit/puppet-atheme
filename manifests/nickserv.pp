class atheme::nickserv (
) {

  concat::fragment { 'atheme_nickserv':
    target  => "${::atheme::install_dir}/etc/atheme.conf",
    order   => '05',
    content => template("${module_name}/nickserv.conf.erb"),
  }

}
