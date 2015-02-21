class atheme::chanserv (
) {

  concat::fragment { 'atheme_chanserv':
    target  => "${::atheme::install_dir}/etc/atheme.conf",
    order   => '05',
    content => template("${module_name}/chanserv.conf.erb"),
  }

}
