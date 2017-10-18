# Webserver profile: configure Apache to run
class profile::webserver {

  include ::apache

  file { "/var/www/${facts['fqdn']}":
    ensure => directory,
  }

  ::apache::vhost { $facts['fqdn']:
    port    => $port,
    docroot => $docroot,
    before  => File["/var/www//index.html"]
  }

  file { "/var/www/${facts['fqdn']}/index.html":
    content => 'Test page <br>This is a test',
  }

}
