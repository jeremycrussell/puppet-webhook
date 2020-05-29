# Class: webhook::config
class webhook::config {
  assert_private()

   ::concat { '/etc/webhook.conf':
    ensure         => present,
    owner          => 'root',
    group          => 'root',
    mode           => '0640',
    format         => 'json-array-pretty',
    ensure_newline => true,
  }
}
