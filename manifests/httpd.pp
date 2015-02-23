class atheme::httpd (
) {

  concat::fragment { 'atheme_httpd':
    target  => "${::atheme::install_dir}/etc/atheme.conf",
    order   => '05',
    content => template("${module_name}/httpd.conf.erb"),
  }

}
