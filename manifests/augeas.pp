class puppetserver::augeas {
  require ::augeas
  ::augeas::lens { 'trapperkeeper':
    ensure      => 'present',
    lens_source => "puppet:///modules/${module_name}/lenses/trapperkeeper.aug",
    test_source => "puppet:///modules/${module_name}/lenses/test_trapperkeeper.aug",
  }
}
