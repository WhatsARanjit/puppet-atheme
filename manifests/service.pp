class atheme::service {

  service { 'atheme daemon':
    ensure    => running,
    start     => "${::atheme::install_dir}/bin/atheme-services",
    hasstatus => false,
    stop      => 'pkill atheme-services',
    pattern   => 'atheme-services',
    subscribe => File["${::atheme::install_dir}/etc/atheme.conf"],
  }

}
