class atheme (
  $adminemail       = $atheme::params::adminemail,
  $adminname        = $atheme::params::adminname,
  $chanserv         = false,
  $desc             = $atheme::params::desc,
  $group            = $atheme::params::group,
  $install_dir      = $atheme::params::install_dir,
  $mta              = $atheme::params::mta,
  $netname          = $atheme::params::netname,
  $nickserv         = false,
  $numeric          = $atheme::params::numeric,
  $protocol         = $atheme::params::protocol,
  $recontime        = $atheme::params::recontime,
  $registeremail    = $atheme::params::registeremail,
  $server_name      = $atheme::params::server_name,
  $tmp_dir          = $atheme::params::tmp_dir,
  $user             = $atheme::params::user,
  $version          = $atheme::params::version,
  $uplink           = $atheme::params::uplink,
  $host             = $atheme::params::host,
  $vhost            = $atheme::params::vhost,
  $port             = $atheme::params::port,
  $send_password    = $atheme::params::send_password,
  $receive_password = $atheme::params::receive_password,
  $password         = $atheme::params::password,

) inherits ::atheme::params {

  if ( $password and ( $send_password or $receive_password ) ) {
    fail('Can\'t use password if using send_password or receive_password.')
  }

  include ::atheme::install
  include ::atheme::configure
  include ::atheme::service

  Class['::atheme::install'] -> Class['::atheme::configure'] -> Class['::atheme::service']

  if $nickserv {
    include ::atheme::nickserv
  }
  if $chanserv {
    include ::atheme::chanserv
  }
}
