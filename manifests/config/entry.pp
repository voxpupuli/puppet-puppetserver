define puppetserver::config::entry (
  $type,
  $value,
  $setting = $name,
) {
  ensure_resource("puppetserver::config::${type}", $setting, {
    ensure => 'present',
    value  => $value,
  })
}
