# == Class: varnish::service
#
# varnish service management
#
class varnish::service inherits varnish {

  if ! ($service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }

  if $service_manage == true {
    # Run Varnish service
    service { 'varnish':
      ensure     => $service_ensure,
      enable     => $service_enable,
      name       => $service_varnish,
      hasstatus  => true,
      hasrestart => true,
    }
    # Run Varnish log service
    service { 'varnishlog':
      ensure     => $service_ensure,
      enable     => $service_enable,
      name       => $service_varnishlog,
      hasstatus  => true,
      hasrestart => true,
    }
    # Run Varnishncsa service
    service { 'varnishncsa':
      ensure     => $service_ensure,
      enable     => $service_enable,
      name       => $service_varnishncsa,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
