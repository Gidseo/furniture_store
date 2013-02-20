class application {

  package {
    "thin":
      name => "thin",
      ensure  => installed,
      provider  => gem,
  }

  file {
    "base_directory":
      path => "${base_dir}",
      ensure => directory,
      owner => "${app_user}",
      group => "${app_group}",
      mode => 775;
    "app_directory":
      path => "${app_dir}",
      ensure => directory,
      owner => "${app_user}",
      group => "${app_group}",
      mode => 775;
    "shared_directory":
      path => "${app_dir}shared",
      ensure => directory,
      owner => "${app_user}",
      group => "${app_group}",
      mode => 775;
    "shared_log_directory":
      path => "${app_dir}shared/log",
      ensure => directory,
      owner => "${app_user}",
      group => "${app_group}",
      mode => 775;
    "shared_config_directory":
      path => "${app_dir}shared/config",
      ensure => directory,
      owner => "${app_user}",
      group => "${app_group}",
      mode => 775;
    "releases_directory":
      path => "${app_dir}releases",
      ensure => directory,
      owner => "${app_user}",
      group => "${app_group}",
      mode => 775;
    "shared_pids_directory":
      path => "${app_dir}shared/pids",
      ensure => directory,
      owner => "${app_user}",
      group => "${app_group}",
      mode => 775;
}

  file { "${app_dir}shared/config/config.yml":
    owner   => "${app_name}",
    group   => "${app_name}",
    mode    => 755,
    content  => template("application/config.yml.erb"),
    require => File["shared_directory"],
    notify => Service["nginx"],
  }

  file { "${app_dir}shared/config/database.yml":
    owner   => "${app_name}",
    group   => "${app_name}",
    mode    => 755,
    content  => template("application/database.yml.erb"),
    require => File["shared_directory"],
    notify => Service["nginx"],
  }

  # add application Nginx config
  file { "/etc/nginx/sites-available/${app_name}.conf":
    owner   => root,
    group   => root,
    mode    => 644,
    content  => template("application/${app_name}.conf.erb"),
    require => Package["nginx"],
    notify => Service["nginx"],
  }

  # create symbolic link from sites-enabled to our someapp.conf file
  file { "/etc/nginx/sites-enabled/${app_name}":
    ensure => 'link',
    target => "/etc/nginx/sites-available/${app_name}.conf",
    require => File["/etc/nginx/sites-available/${app_name}.conf"],
    notify => Service["nginx"],
  }


  # Add thin startup init script
  file { "/etc/init.d/thin":
    owner   => root,
    group   => root,
    mode    => 755,
    source  => "puppet:///modules/application/thin",
    require => Package["thin"],
  }

  exec {
    "generate_thin_config":
      command => "sudo /usr/sbin/update-rc.d -f thin defaults",
      unless => "sudo ls /etc/rc0.d/K20thin",
      require => File["/etc/init.d/thin"],
      notify => Service["nginx"],
  }

  # TODO remove this temporary content
  #exec {
  #  "touch_index":
  #    command => "touch ${app_dir}current/public/index.html; echo '<h1>hello world</h1>' > ${app_dir}current/public/index.html",
  #    require => File["public_directory"],
  #}

}
