class atheme::install {
  
  if ! defined ( File[$::atheme::install_dir] ) {
    file { $::atheme::install_dir:
      ensure => directory,
      owner  => $::atheme::user,
      group  => $::atheme::group,
      mode   => '0755',
    }
  }

  staging::deploy { "atheme-services-${::atheme::version}.tar.bz2":
    source => "http://atheme.net/downloads/atheme-services-${::atheme::version}.tar.bz2",
    target => $::atheme::tmp_dir,
  } ->
  exec { './configure atheme':
    path    => "${::path}:${::atheme::tmp_dir}/atheme-services-${::atheme::version}",
    cwd     => "${::atheme::tmp_dir}/atheme-services-${::atheme::version}",
    command => "./configure --prefix=${$::atheme::install_dir}/",
    creates => "${::atheme::tmp_dir}/atheme-services-${::atheme::version}/config.status"
  } ~>
  exec { 'make atheme':
    path        => $::path,
    cwd         => "${::atheme::tmp_dir}/atheme-services-${::atheme::version}",
    command     => 'make',
    refreshonly => true,
  } ->
  exec { 'make install atheme':
    path    => $::path,
    cwd     => "${::atheme::tmp_dir}/atheme-services-${::atheme::version}",
    command => 'make install',
    creates => "${::atheme::install_dir}/bin/atheme-services",
  }

}
