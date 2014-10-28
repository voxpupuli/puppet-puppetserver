define puppetserver::config::helper (
  $type,
  $setting,
) {
  $split_name = split($name, '/')
  $section = $split_name[0]
  $key = $split_name[1]

  if has_key($::puppetserver::config, $section) {
    if has_key($::puppetserver::config[$section], $key) {
      ::puppetserver::config::entry { $title:
        type    => $type,
        setting => $setting,
        value  => $::puppetserver::config[$section][$key],
      }
    }
  }
}
