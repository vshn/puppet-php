# Install composer package manager
#
# === Parameters
#
# [*max_age*]
#   Defines number of days after which Composer should be updated
#
# [*source*]
#   Holds URL to the Composer source file
#
# [*path*]
#   Holds path to the Composer executable
#
<<<<<<< HEAD
=======
# [*channel*]
#   Holds the Update channel (stable|preview|snapshot|1|2)
#
>>>>>>> f89846c1486c2499352862e4a00b9adb6a3239d3
# [*proxy_type*]
#    proxy server type (none|http|https|ftp)
#
# [*proxy_server*]
#   specify a proxy server, with port number if needed. ie: https://example.com:8080.
#
#
# === Examples
#
#  include php::composer::auto_update
#  class { "php::composer::auto_update":
#    "max_age" => 90
#  }
#
class php::composer::auto_update (
  $max_age,
  $source,
  $path,
<<<<<<< HEAD
  $proxy_type   = undef,
  $proxy_server = undef,
=======
  Php::ComposerChannel  $channel = 'stable',
  $proxy_type                    = undef,
  $proxy_server                  = undef,
>>>>>>> f89846c1486c2499352862e4a00b9adb6a3239d3
) {
  assert_private()

  if $proxy_type and $proxy_server {
    $env = ['HOME=/root', "${proxy_type}_proxy=${proxy_server}"]
  } else {
    $env = ['HOME=/root']
  }

  if $proxy_type and $proxy_server {
    $env = [ 'HOME=/root', "${proxy_type}_proxy=${proxy_server}" ]
  } else {
    $env = [ 'HOME=/root' ]
  }

  exec { 'update composer':
<<<<<<< HEAD
    command     => "${path} --no-interaction --quiet self-update",
    environment => $env,
    onlyif      => "test `find '${path}' -mtime +${max_age}`",
    path        => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin', '/usr/local/sbin' ],
    require     => [File[$path], Class['::php::cli']],
=======
    # touch binary when an update is attempted to update its mtime for idempotency when no update is available
    command     => "${path} --no-interaction --quiet self-update --${channel}; touch ${path}",
    environment => $env,
    onlyif      => "test `find '${path}' -mtime +${max_age}`",
    path        => ['/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin', '/usr/local/sbin'],
    require     => [File[$path], Class['php::cli']],
>>>>>>> f89846c1486c2499352862e4a00b9adb6a3239d3
  }
}
