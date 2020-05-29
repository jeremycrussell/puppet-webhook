# Class: webhook::config
class webhook::config {
  assert_private()

   ::concat { '/etc/webhook.conf':
    ensure         => present,
    owner          => 'root',
    group          => 'root',
    mode           => '0640',
    ensure_newline => true,
  }
  
  ::concat::fragment { 'webhook json-array-opening':
    target  => '/etc/webhook.conf',
    order   => '01',
    content => '[',
  }

  ::concat::fragment { 'webhook json-array-closing':
    target  => '/etc/webhook.conf',
    order   => '99',
    content => ']',
  }
}
