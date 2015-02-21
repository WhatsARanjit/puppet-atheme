class atheme::configure {

  concat { "${::atheme::install_dir}/etc/atheme.conf":
    owner   => $user,
    group   => $group,
    mode    => '0660',
    warn    => true,
  }

  concat::fragment { 'atheme_main':
    target  => "${::atheme::install_dir}/etc/atheme.conf",
    order   => '01',
    content => template("${module_name}/atheme.conf.erb"),
  }
  concat::fragment { 'atheme_main2':
    target  => "${::atheme::install_dir}/etc/atheme.conf",
    order   => '10',
    content => template("${module_name}/atheme2.conf.erb"),
  }

}
