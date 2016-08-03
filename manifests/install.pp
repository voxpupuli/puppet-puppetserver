class puppetserver::install {
  package { 'puppetserver':
    ensure => $::puppetserver::version,
    name   => $::puppetserver::package,
  }

  # Make sure that puppetserver is installed, prior to installing puppetserver gem's
  # (otherwise the ressource collector does not work and we need multiple puppet runs)
  Package <| title == 'puppetserver' |> -> Package <| provider == 'puppetserver_gem' |>
}
