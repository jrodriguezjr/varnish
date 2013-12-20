# == Class: varnish::params
#
# varnish class parameters
#
class varnish::params {

  # Global config params
  $package_ensure       = 'present'
  $service_enable       = true
  $service_ensure       = 'running'
  $service_manage       = true
  $vfrontend_port       = '8080'
  $vbackend_servers     = [ '127.0.0.1', ]
  $vbackend_port        = '80'
  $varnishlog_enabled   = '1'
  $varnishncsa_enabled  = '1'

  case $::osfamily {
    'Debian': {
      $config                 = '/etc/default/varnish'
      $config_template        = 'varnish/varnish.DEBIAN.erb'
      $package_name           = [ 'varnish' ]
      $service_name           = 'varnish'
      $varnishlog_config      = '/etc/default/varnishlog'
      $varnishlog_template    = 'varnish/varnishlog.DEBIAN.erb'
      $vcl_config             = '/etc/varnish/default.vcl'
      $vcl_config_template    = 'varnish/default.vcl.DEBIAN.erb'
      $varnishncsa_config     = 'varnish/default.vncsa.DEBIAN.erb'
    }
    # TODO: Add support for more Operating Systems
    # 'RedHat': {
    #$config                 = '/etc/default/varnish'
    #$config_template        = 'varnish/varnish.DEBIAN.erb'
    #$varnishlog_config      = '/etc/default/varnishlog'
    #$varnishlog_template    = 'varnish/varnishlog.DEBIAN.erb'
    #$vcl_config             = '/etc/varnish/default.vcl'
    #$vcl_config_template    = 'varnish/default.vcl.DEBIAN.erb'
    #$package_name           = [ 'varnish' ]
    #$service_name           = 'varnish'
    # }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
