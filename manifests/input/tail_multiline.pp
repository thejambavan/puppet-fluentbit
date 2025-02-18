# @summary Input plugin to monitor one or several text files. Split off from the main 'tail' input
# because multiline is handled differently for fluent-bit  >1.8 

define fluentbit::input::tail_multiline (
  Stdlib::Absolutepath $path,
  Stdlib::Absolutepath $configfile = "/etc/fluent-bit/input_tail_${name}.conf",
  String $multiline_parser,
  String $read_from_head           =  true,
  String $db                       = "/var/log/fluent-bit.db"

) {

  file { $configfile:
    ensure  => file,
    mode    => $fluentbit::config_file_mode,
    content => template('fluentbit/input/tail_multiline.conf.erb'),
    notify  => Class['fluentbit::service'],
  }
}
