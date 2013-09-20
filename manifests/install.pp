# Install
class varnish::install inherits varnish {

  package { 'varnish':
    ensure => $package_ensure,
    name   => $package_name,
  }

}
