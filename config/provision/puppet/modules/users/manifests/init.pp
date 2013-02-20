class users {

  group { "admin":
    ensure => 'present',
  }

  group { "www-data":
    ensure => 'present',
  }

  group { "${app_group}":
    ensure => 'present',
  }

  user { "${app_user}":
     gid => "${app_group}",
     comment => 'The application user',
     managehome => 'true',
     shell => '/bin/bash',
     ensure => 'present',
     require => Group["${app_user}", "admin"],
  }

  # this key was generated from the some_aws.pem file:
  #  ssh-keygen -y -f some_aws.pem
  #  now ssh in with:  ssh username@33.33.33.33 -i ~/.ssh/some_aws.pem
  ssh_authorized_key { "${app_user_pem}":
    ensure => "present",
    type => "ssh-rsa",
    key => "${app_ssh_key}",
    user => "${app_user}",
  }

  user { "www-data":
     gid => 'www-data',
     comment => 'The www-data web server user',
     managehome => 'false',
     ensure => 'present',
     require => Group["www-data"],
  }

  user { "emson":
     gid => 'admin',
     comment => 'emson user',
     managehome => 'true',
     ensure => 'present',
     shell => '/bin/bash',
     require => Group["admin"],
  }


  ssh_authorized_key { "ben@emson.co.uk":
    ensure => "present",
    type => "ssh-rsa",
    key => "${app_ssh_key}",
    user => "emson"
  }


  file { "/home/${app_user}/.bash_profile":
    owner => "${app_user}",
    group => "${app_group}",
    mode => 644,
    source => "puppet:///modules/users/bash_profile",
    require => User["${app_user}"],
  }

  file { "/home/emson/.bash_profile":
    owner => "emson",
    group => "admin",
    mode => 644,
    source => "puppet:///modules/users/bash_profile",
    require => User["emson"],
  }


}
