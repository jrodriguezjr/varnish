# Params
class varnish::params {

  $autoupdate        = false
  $package_ensure    = 'present'
  $service_enable    = true
  $service_ensure    = 'running'
  $service_manage    = true
  $vfrontend_port    = '8080'
  $vbackend_servers  = [ '127.0.0.1', ]
  $vbackend_port     = '80'

  case $::osfamily {
    'Debian': {
      $config             = '/etc/varnish/defualt.vcl'
      $config_template    = 'varnish/default.vcl.DEBIAN.erb'
      $package_name       = [ 'varnish' ]
      $service_name       = 'varnish'
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
