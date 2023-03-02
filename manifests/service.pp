# @summary Manages the td-agent-bit service
#
# @private
class fluentbit::service {
  assert_private()

  if $fluentbit::manage_service {
    service { 'fluent-bit':
      ensure     => $fluentbit::service_ensure,
      enable     => $fluentbit::service_enable,
      hasstatus  => $fluentbit::service_has_status,
      hasrestart => $fluentbit::service_has_restart,
      name       => $::fluentbit::service_name,
    }
  }
}
