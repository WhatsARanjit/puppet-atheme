class atheme (
  $adminemail       = $atheme::params::adminemail,
  $adminname        = $atheme::params::adminname,
  $chanserv         = false,
  $desc             = $atheme::params::desc,
  $group            = $atheme::params::group,
  $host             = $atheme::params::host,
  $httpd            = false,
  $httpd_host       = $atheme::params::httpd_host,
  $httpd_port       = $atheme::params::httpd_port,
  $httpd_root       = $atheme::params::httpd_root,
  $install_dir      = $atheme::params::install_dir,
  $mta              = $atheme::params::mta,
  $netname          = $atheme::params::netname,
  $nickserv         = false,
  $numeric          = $atheme::params::numeric,
  $password         = $atheme::params::password,
  $port             = $atheme::params::port,
  $protocol         = $atheme::params::protocol,
  $receive_password = $atheme::params::receive_password,
  $recontime        = $atheme::params::recontime,
  $registeremail    = $atheme::params::registeremail,
  $send_password    = $atheme::params::send_password,
  $server_name      = $atheme::params::server_name,
  $tmp_dir          = $atheme::params::tmp_dir,
  $uplink           = $atheme::params::uplink,
  $user             = $atheme::params::user,
  $version          = $atheme::params::version,
  $vhost            = $atheme::params::vhost,

) inherits ::atheme::params {

  if ( $password and ( $send_password or $receive_password ) ) {
    fail('Can\'t use password if using send_password or receive_password.')
  }

  include ::atheme::install
  include ::atheme::configure
  include ::atheme::service

  Class['::atheme::install'] -> Class['::atheme::configure'] -> Class['::atheme::service']

  if $httpd {
    include ::atheme::httpd
  }
  if $nickserv {
    include ::atheme::nickserv
  }
  if $chanserv {
    include ::atheme::chanserv
  }
}
