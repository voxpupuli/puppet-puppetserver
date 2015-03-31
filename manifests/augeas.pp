class puppetserver::augeas {
  require ::augeas
  ::augeas::lens { 'trapperkeeper':
    ensure       => 'present',
    lens_content => file("${module_name}/lenses/trapperkeeper.aug"),
    test_content => file("${module_name}/lenses/test_trapperkeeper.aug"),
  }
}
