class authldap::config {

  require(authldap::packages)

  File {
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => 0644,
    require => Package[ $authldap::packages ],
    notify  => Service[ $authldap::services ],
  }

  file {

    '/etc/login.defs':
      source => 'puppet:///modules/authldap/login.defs';

    '/etc/pam.d/system-auth-ac':
      content => template('authldap/system-auth-ac.erb');

    '/etc/nsswitch.conf':
      source => 'puppet:///modules/authldap/nsswitch.conf';

    '/etc/sysconfig/authconfig':
      source => 'puppet:///modules/authldap/authconfig';

    '/etc/pam.d/system-auth':
      ensure => link,
      target => '/etc/pam.d/system-auth-ac',
      force  => true;

    '/etc/pam.d/password-auth-ac':
      content => template('authldap/password-auth-ac.erb');

    '/etc/pam.d/password-auth':
      ensure => link,
      target => '/etc/pam.d/password-auth-ac',
      force  => true;

    '/etc/nscd.conf':
      content => template('authldap/nscd.conf.erb');

    '/etc/nslcd.conf':
      content => template('authldap/nslcd.conf.erb'),
      mode    => '0640';

    '/etc/pam_ldap.conf':
      content => template('authldap/pam_ldap.conf.erb'),
      mode    => '0640';

    '/etc/openldap/ldap.conf':
      content => template('authldap/ldap.conf.erb');
  }
}
