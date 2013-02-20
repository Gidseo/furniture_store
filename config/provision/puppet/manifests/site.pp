Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
}

$extlookup_datadir = "/etc/puppet/extdata"
$extlookup_precedence = ["settings", "users"]

$app_name         = extlookup("app_name"         , "app_name")
$base_dir         = extlookup("base_dir"         , "/var/www/")
$app_dir          = extlookup("app_dir"          , "/var/www/app_name/")
$email_account    = extlookup("email_account"    , "my_name@somewhere.com")
$email_password   = extlookup("email_password"   , "email_password")
$app_user         = extlookup("app_user"         , "app_user")
$app_group        = extlookup("app_group"        , "app_group")
$app_user_pem     = extlookup("app_user_pem"     , "app_name.pem.pub")
$app_ssh_key      = extlookup("app_ssh_key"      , "app_ssh_key")

import "nodes.pp"

