# Defined type: webhook::hook
define webhook::hook (
  Hash $settings
) {
  include ::webhook

  ::concat::fragment { "webhook ${title}":
    target  => '/etc/webhook.conf',
    content => to_json($settings),
  }
}
