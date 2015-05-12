class authldap::params {

  $ldapServer = 'ldaps://dc1.example.org:636/ ldaps://dc2.example.org:636/'
  $ssl  = 'yes'
  $bindUser = 'cn=ServiceAccount,ou=Users,dc=example,dc=org'
  $bindPassword = 'ServiceAccountPassword'
  $baseDC  = 'dc=example,dc=org'
  $nssBasePasswd = 'OU=Users,DC=example,DC=org?sub'
  $nssBaseShadow = 'OU=Users,DC=example,DC=org?sub'
  $nssBaseGroup = 'OU=Users,DC=example,DC=org?sub'
  $services = [ 'nslcd', 'nscd' ]
  $packages  = [ 'openldap', 'nss-pam-ldapd', 'nscd' ]
  $tlsReqcert  = 'demand'
  $passwdTTL = '3600'
  $groupTTL = '3600'
  $pamTallyDeny = '5'
  $cacert = '/path/to/signing/cert.pem'

}
