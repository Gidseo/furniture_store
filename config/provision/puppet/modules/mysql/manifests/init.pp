class mysql::server {

  package { "mysql-server": ensure => installed }
  #package { "mysql": ensure => installed }

  #service { "mysql":
  #  enable => true,
  #  ensure => running,
  #  provider => 'upstart',
  #  require => Package["mysql-server"],
  #}

  file { "/etc/mysql/my.cnf":
    owner => "mysql", group => "mysql",
    source => "puppet:///modules/mysql/my.cnf",
    #notify => Service["mysql"],
    require => Package["mysql-server"],
  }

  #exec { "set-mysql-password":
  #  unless => "mysqladmin -uroot -p$mysql_password status",
  #  path => ["/bin", "/usr/bin"],
  #  command => "mysqladmin -uroot password $mysql_password",
  #  require => Service["mysqld"],
  #}
}
