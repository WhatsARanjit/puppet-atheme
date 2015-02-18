class atheme (

  $group       = $atheme::params::group,
  $install_dir = $atheme::params::install_dir,
  $tmp_dir     = $atheme::params::tmp_dir,
  $user        = $atheme::params::user,
  $version     = $atheme::params::version,

) inherits ::atheme::params {

  include ::atheme::install

}
