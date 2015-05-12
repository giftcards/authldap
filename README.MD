## Synopsis

Puppet module to setup CentOS 6 ldap authentication to Active Directory. 

## Example

Defaults are stored in params.pp, much of the syntax matches the configuration for nslcd (see man nslcd.conf). Typically I updated params.pp and use hiera for overrides in specific situations and for passwords.
Tested PCI compliant as of 2014.
Uses nslcd/nscd/openldap.

## Motivation

Required for PCI compliance.

## Installation

Tested on CentOS 6 with Active Directory using Windows Server 2008 R2.
Requires Unix Server Extensions to be installed on the domain controller.
The binding user does not require any specific privileges. Typically Domain Users should be removed and a nonpermissive group set as primary.
Does not require any special repositories.

## API Reference

ldapServer = Space separated string of ldap uris. ex: 'ldaps://dc1.example.org:636/' would attempt ldaps against dc1.
ssl = yes/no to enable ssl communication with the domain controller, requires cacert, highly recommended
bindUser = common name address of the user to bind to active directory with, does not require domain user/admin permissions, see params.pp for ex
bindPassword = password for the active directory binding user
baseDC = dc address of active directory, see params.pp for ex
nssBasePasswd = nss_base_passwd string from nslcd.conf, see params.pp for ex
nssBaseShadow = nss_base_shadow string from nslcd.conf, see params.pp for ex
nssBaseGroup = nss_base_group string from nslcd.conf, see params.pp for ex
tlsReqcert = tls_req_cert from nslcd.conf, configures certificate verification for ssl binding, defaults to 'demand'. It's a terrible idea but you can set this to 'allow' if you don't want to have to deal with the signing cert.
passwdTTL = sets the password caching timeout in nscd
groupTTL = sets the group caching timeout in nscd
pamTallyDeny = sets how many bad attempts before pam locks out the account locally, defaults to 5
cacert = path to the signing cert for the certificate attached to LDAPS on your domain controller

## Contributors

Ryan Munz for Giftcards.com - May 2015
