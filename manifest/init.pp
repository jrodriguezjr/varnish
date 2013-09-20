class varnish (
  $autoupdate        = $varnish::params::autoupdate,
  $config            = $varnish::params::config,
  $config_template   = $varnish::params::config_template,
#  $driftfile         = $varnish::params::driftfile,
#  $keys_enable       = $varnish::params::keys_enable,
#  $keys_file         = $varnish::params::keys_file,
#  $keys_controlkey   = $varnish::params::keys_controlkey,
#  $keys_requestkey   = $varnish::params::keys_requestkey,
#  $keys_trusted      = $varnish::params::keys_trusted,
  $package_ensure    = $varnish::params::package_ensure,
  $package_name      = $varnish::params::package_name,
#  $panic             = $varnish::params::panic,
#  $preferred_servers = $varnish::params::preferred_servers,
#  $restrict          = $varnish::params::restrict,
  $servers           = $varnish::params::servers,
  $service_enable    = $varnish::params::service_enable,
  $service_ensure    = $varnish::params::service_ensure,
  $service_manage    = $varnish::params::service_manage,
  $service_name      = $varnish::params::service_name,
) inherits varnish::params {

  validate_absolute_path($config)
  validate_string($config_template)
#  validate_absolute_path($driftfile)
#  validate_bool($keys_enable)
#  validate_re($keys_controlkey, ['^\d+$', ''])
#  validate_re($keys_requestkey, ['^\d+$', ''])
#  validate_array($keys_trusted)
  validate_string($package_ensure)
  validate_array($package_name)
#  validate_bool($panic)
#  validate_array($preferred_servers)
#  validate_array($restrict)
  validate_array($servers)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_bool($service_manage)
  validate_string($service_name)

  if $autoupdate {
    notice('autoupdate parameter has been deprecated and replaced with package_ensure.  Set this to latest for the same behavior as autoupdate => true.')
  }

  include '::varnish::install'
  include '::varnish::config'
  include '::varnish::service'

  # Anchor this as per #8040 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'varnish::begin': }
  anchor { 'varnish::end': }

  Anchor['varnish::begin'] -> Class['::varnish::install'] -> Class['::varnish::config']
    ~> Class['::varnish::service'] -> Anchor['varnish::end']

}
