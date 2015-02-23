class atheme::params {

  $adminemail    = "admin@${::fqdn}"
  $adminname     = 'Atheme IRC Admin'
  $desc          = 'Atheme IRC Services'
  $group         = 'root'
  $install_dir   = '/var/lib/atheme'
  $mta           = '/usr/sbin/sendmail'
  $netname       = $::domain
  $numeric       = '00A'
  $protocol      = 'charybdis'
  $recontime     = 10
  $registeremail = "noreply@${::fqdn}"
  $server_name   = $::fqdn
  $tmp_dir       = '/tmp'
  $user          = 'root'
  $version       = '7.2.5'
  # Uplink information
  $uplink = $::fqdn
  $host   = $::ipaddress
  $vhost  = false
  $port   = 6667
  # Password settings
  $send_password    = false
  $receive_password = false
  $password         = false
  # HTTPD defaults
  $httpd_host = '0.0.0.0'
  $httpd_root = '/var/www/html'
  $httpd_port = 8080

}
