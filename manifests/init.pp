class authldap (

  $ldapServer = $authldap::params::ldapServer,
  $ssl = $authldap::params::ssl,
  $bindUser = $authldap::params::bindUser,
  $bindPassword = $authldap::params::bindPassword,
  $baseDC = $authldap::params::baseDC,
  $nssBasePasswd = $authldap::params::nssBasePasswd,
  $nssBaseShadow = $authldap::params::nssBaseShadow,
  $nssBaseGroup = $authldap::params::nssBaseGroup,
  $tlsReqcert = $authldap::params::tlsReqcert,
  $passwdTTL = $authldap::params::passwdTTL,
  $groupTTL = $authldap::params::groupTTL,
  $pamTallyDeny = $authldap::params::pamTallyDeny,
  $cacert = $authldap::params::cacert,
  $packages = $authldap::params::packages,
  $services = $authldap::params::services,

) inherits authldap::params {

  include authldap::params
  include authldap::packages
  include authldap::config
  include authldap::services

}
