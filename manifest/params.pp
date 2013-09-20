class ntp::params {

  $autoupdate        = false
  $config_template   = 'varnish/varnish.vcl.erb'
  $package_ensure    = 'present'
  $service_enable    = true
  $service_ensure    = 'running'
  $service_manage    = true

  case $::osfamily {
    'Debian': {
      $config          = '/etc/varnish/varnish.vcl'
      $package_name    = [ 'varnish' ]
      $service_name    = 'varnish'
      $servers         = [
        '',
      ]
    }
    # 'RedHat': {
    #   $config          = '/etc/ntp.conf'
    #   $package_name    = [ 'ntp' ]
    #   $service_name    = 'ntpd'
    #   $servers         = [
    #     '0.centos.pool.ntp.org',
    #   ]
    # }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
