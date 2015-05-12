class authldap::services {

  require(authldap::config)
  require(authldap::packages)

  Service {
    ensure  => running,
    enable  => true,
    hasrestart  => true,
    hasstatus  => true,
    require  => Package [ $authldap::packages ],
  }

  service { $authldap::services: }
}
