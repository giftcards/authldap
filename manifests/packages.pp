class authldap::packages {

  package { $authldap::params::packages: ensure => installed, }

}
