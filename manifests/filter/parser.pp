# @summary Filter to parser records using rules and conditions
#
# @param configfile
#  Path to the filter configfile. Naming should be filter_*.conf to make sure
#  it's getting included by the main config.
define fluentbit::filter::parser (
  String $configfile         = '/etc/fluent-bit/filter_parser.conf',
  String $match              = '*',
  String $key_name           = 'log',
  String $parser             = 'my_parser'
  ,
) {
  # create filter_parser.conf
  # TODO: concat for multiple entries
  file { $configfile:
    ensure  => file,
    mode    => '0644',
    content => template('fluentbit/filter/parser.conf.erb'),
    notify  => Class['fluentbit::service'],
    require => Class['fluentbit::install'],
  }
}
