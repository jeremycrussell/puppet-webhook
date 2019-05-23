# Class: webhook::install
class webhook::install {
  assert_private()

  case $::osfamily {
    'Debian': {
      package { 'webhook':
        ensure => installed,
      }
    }
    'RedHat': {
      file { '/root/rpms':
        ensure => 'directory',
        owner => 'root',
        group => 'root'
      } ->
      file { '/root/rpms/webhook-2.5.0-3.x86_64.rpm':
        ensure => 'file',
        owner => 'root',
        group => 'root',
        source => 'puppet:///modules/webhook/rpms/webhook-2.5.0-3.x86_64.rpm'
      } ->
      package { 'webhook-2.5.0-3.x86_64':
        ensure => 'installed',
        provider => 'rpm',
        source => '/root/rpms/webhook-2.5.0-3.x86_64.rpm',
        require => File["/root/rpms/webhook-2.5.0-3.x86_64.rpm"],
      }
    }
  }
}
