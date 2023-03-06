# @summary Plugin to output logs to a configured opensearch instance
#
define fluentbit::output::opensearch (
  String $configfile                    = "/etc/fluent-bit/output_opensearch_${name}.conf",
  String $match                         = '*',
  Stdlib::Host $host                    = '127.0.0.1',
  Stdlib::Port $port                    = 9200,
  String $index                         = 'fluentbit',
  String $type                          = 'flb_type',
  String $write_operation               = 'index',
  Enum['on', 'off'] $tls                = 'off',
  Enum['on', 'off'] $tls_verify         = 'off',
  Enum['on', 'off'] $logstash_format    = 'on',
  Enum['on', 'off'] $suppress_type_name = 'off',
  Optional[String] $http_user           = undef,
  Optional[String] $http_passwd         = undef,
  Optional[String] $logstash_prefix     = 'on',
) {
  file { $configfile:
    ensure  => file,
    mode    => $fluentbit::config_file_mode,
    content => template('fluentbit/output/opensearch.conf.erb'),
    notify  => Class['fluentbit::service'],
    require => Class['fluentbit::install'],
  }
}
