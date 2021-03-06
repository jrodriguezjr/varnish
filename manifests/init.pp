# == Class: varnish
#
# varnish main class
#
class varnish (
  $autoupdate               = $varnish::params::autoupdate,
  $config                   = $varnish::params::config,
  $config_template          = $varnish::params::config_template,
  $package_ensure           = $varnish::params::package_ensure,
  $package_name             = $varnish::params::package_name,
  $service_enable           = $varnish::params::service_enable,
  $service_ensure           = $varnish::params::service_ensure,
  $service_manage           = $varnish::params::service_manage,
  $service_varnish          = $varnish::params::service_varnish,
  $vbackend_servers         = $varnish::params::vbackend_servers,
  $vbackend_port            = $varnish::params::vbackend_port,
  $vbackend_hostrewrite     = $varnish::params::vbackend_hostrewrite,
  $altbackend_servers       = $varnish::params::altbackend_servers,
  $altbackend_port          = $varnish::params::altbackend_port,
  $altbackend_hostrewrite   = $varnish::params::altbackend_hostrewrite,
  $vfrontend_port           = $varnish::params::vfrontend_port,
  $varnishlog_config        = $varnish::params::varnishlog_config,
  $varnishlog_template      = $varnish::params::varnishlog_template,
  $vcl_config               = $varnish::params::vcl_config,
  $vcl_config_template      = $varnish::params::vcl_config_template,
  $varnishlog_enabled       = $varnish::params::varnishlog_enabled,
) inherits varnish::params {

  # Sanity Checks: Input Param Validations
  validate_absolute_path($config)
  validate_string($config_template)
  validate_string($package_ensure)
  validate_array($package_name)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_bool($service_manage)
  validate_string($service_varnish)
  validate_array($vbackend_servers)
  validate_string($vbackend_port)
  validate_string($vfrontend_port)
  validate_string($varnishlog_config)
  validate_string($varnishlog_template)
  validate_string($vcl_config)
  validate_string($vcl_config_template)


  # Include other classes
  include '::varnish::install'
  include '::varnish::config'
  include '::varnish::service'

  # Anchor this ship!
  # Anchor this as per #8040 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'varnish::begin': }
  anchor { 'varnish::end': }

  Anchor['varnish::begin'] -> Class['::varnish::install'] -> Class['::varnish::config']
    ~> Class['::varnish::service'] -> Anchor['varnish::end']

}
