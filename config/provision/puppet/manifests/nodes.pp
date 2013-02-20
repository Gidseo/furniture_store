node "default" {

  include timezone
  include ntp
  include users
  include prerequisites

  include application
  include nginx
  include mysql::server

}

