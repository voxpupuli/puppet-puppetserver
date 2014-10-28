class puppetserver::augeas {
  require ::augeas
  ::augeas::lens { 'trapperkeeper':
    ensure      => 'present',
    lens_source => "puppet:///modules/${module_name}/lenses/trapperkeeper.aug",
    test_source => "puppet:///modules/${module_name}/lenses/tests/test_trapperkeeper.aug",
  }
}
