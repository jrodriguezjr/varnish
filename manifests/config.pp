# == Class: varnish::config
#
# varnish config settings
#
class varnish::config inherits varnish {

  # main varnish config
  file { $config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template($config_template),
  }
  # VCL template
  file { $vcl_config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template($vcl_config_template),
  }
  # vanishlog config template
  file { $varnishlog_config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template($varnishlog_template),
  }
  # Varnishncsa log template
  file { $varnishncsa_config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template($varnishncsa_template),
  }
}
