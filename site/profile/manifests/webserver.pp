# Webserver profile: configure Apache to run
class profile::webserver(
  Boolean $default_vhost = true,
  Integer $port = 8080,
  String $docroot = "/var/www/${facts['fqdn']}",
  String $page_content = 'Test page <br> This is a test',
){

  class { '::apache':
    default_vhost => $default_vhost,
  }

  ::apache::vhost { $facts['fqdn']:
    port    => $port,
    docroot => $docroot,
    before  => File["${docroot}/index.html"]
  }

  file { "${docroot}/index.html":
    content => $page_content,
  }

}
