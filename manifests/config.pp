# Configuration Settings
class varnish::config inherits varnish {

  # main varnish config
  file { $config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template($config_template),
  }
  # vanishlog cofiguration
  file { $varnishlog_config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template($varnishlog_template),
  }
  # VCL template
  file { $vcl_config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template($vcl_config_template),
  }

}
