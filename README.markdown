#varnish

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with varnish](#setup)
    * [What varnish affects](#what-varnish-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with varnish](#beginning-with-varnish)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

The Varnish module installs, configures, and manages the varnish service.

##Module Description

The Varnish module handles running the Varnish caching system on your server.

##Setup

###What varnish affects

* varnish package.
* varnish configuration file.
* varnish service.

###Beginning with varnish

include '::varnish' is enough to get you up and running.  If you wish to pass in
parameters like which servers to use then you can use:

```puppet
class { '::varnish':
  servers => [ 'varnish1.corp.com', 'varnish2.corp.com' ],
}
```

##Usage

All interaction with the varnish module can do be done through the main varnish class.
This means you can simply toggle the options in the varnish class to get at the
full functionality.

###I just want varnish, what's the minimum I need?

```puppet
include '::varnish'
```

###I just want to tweak the servers, nothing else.

```puppet
class { '::varnish':
  servers => [ 'varnish1.corp.com', 'varnish2.corp.com' ],
}
```

###I'd like to make sure I restrict who can connect as well.

```puppet
class { '::varnish':
  servers  => [ 'varnish1.corp.com', 'varnish2.corp.com' ],
  restrict => 'restrict 127.0.0.1',
}
```

###I'd like to opt out of having the service controlled, we use another tool for that.

```puppet
class { '::varnish':
  servers        => [ 'varnish1.corp.com', 'varnish2.corp.com' ],
  restrict       => 'restrict 127.0.0.1',
  manage_service => false,
}
```

###Looks great!  But I'd like a different template, we need to do something unique here.

```puppet
class { '::varnish':
  servers         => [ 'varnish1.corp.com', 'varnish2.corp.com' ],
  restrict        => 'restrict 127.0.0.1',
  manage_service  => false,
  config_template => 'different/module/custom.template.erb',
}
```

##Reference

###Classes

* varnish: Main class, includes all the rest.
* varnish::install: Handles the packages.
* varnish::config: Handles the configuration file.
* varnish::service: Handles the service.

###Parameters

The following parameters are available in the varnish module

####`autoupdate`

Deprecated: This parameter previously determined if the varnish module should be
automatically updated to the latest version available.  Replaced by package\_
ensure.

####`config`

This sets the file to write varnish configuration into.

####`config_template`

This determines which template puppet should use for the varnish configuration.

<<<<<<< HEAD
=======
####`driftfile`

This sets the location of the driftfile for varnish.

####`keys_controlkey`

Which of the keys is used as the control key.

####`keys_enable`

Should the varnish keys functionality be enabled.

####`keys_file`

Location of the keys file.

####`keys_requestkey`

Which of the keys is used as the request key.

>>>>>>> d6f49b7695e98a55364720b277587fa6ea9a25bb
####`package_ensure`

This can be set to 'present' or 'latest' or a specific version to choose the
varnish package to be installed.

####`package_name`

This determines the name of the package to install.

<<<<<<< HEAD
=======
####`panic`

This determines if varnish should 'panic' in the event of a very large clock skew.
We set this to false if you're on a virtual machine by default as they don't
do a great job with keeping time.

####`preferred_servers`

List of varnish servers to prefer.  Will append prefer for any server in this list
that also appears in the servers list.

####`restrict`

This sets the restrict options in the varnish configuration.

>>>>>>> d6f49b7695e98a55364720b277587fa6ea9a25bb
####`servers`

This selects the servers to use for varnish peers.

####`service_enable`

This determines if the service should be enabled at boot.

####`service_ensure`

This determines if the service should be running or not.

####`service_manage`

This selects if puppet should manage the service in the first place.

####`service_name`

This selects the name of the varnish service for puppet to manage.


##Limitations

This module has been built on and tested against Puppet 2.7 and higher.

The module has been tested on:

* Debian 6/7
<<<<<<< HEAD
* Ubuntu 12.04
* CentOS 5/6
=======
* CentOS 5/6
* Ubuntu 12.04
>>>>>>> d6f49b7695e98a55364720b277587fa6ea9a25bb

Testing on other platforms has been light and cannot be guaranteed. 

##Development

Puppet Labs modules on the Puppet Forge are open projects, and community
contributions are essential for keeping them great. We can’t access the
huge number of platforms and myriad of hardware, software, and deployment
configurations that Puppet is intended to serve.

We want to keep it as easy as possible to contribute changes so that our
<<<<<<< HEAD
modules work in your environment. There are <a href=""></a> few guidelines that we need
=======
modules work in your environment. There are a few guidelines that we need
>>>>>>> d6f49b7695e98a55364720b277587fa6ea9a25bb
contributors to follow so that we can have a chance of keeping on top of things.

You can read the complete module contribution guide [on the Puppet Labs wiki.](http://projects.puppetlabs.com/projects/module-site/wiki/Module_contributing)
