# Class: caddy
# ===========================
#
# Examples
# --------
#
# ```puppet
# include caddy
# ```
#
# Install caddy with additiional features
#
# ```puppet
# class {'caddy':
#   caddy_features = "http.filter,http.git,http.ipfilter",
# }
# ```
#
# Authors
# -------
#
# Lukasz Rohde <kujon447@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2016 Lukasz Rohde.
#
class caddy (

  String                         $install_path     = $caddy::params::install_path,
  String                         $caddy_user       = $caddy::params::caddy_user,
  String                         $caddy_group      = $caddy::params::caddy_group,
  String                         $caddy_log_dir    = $caddy::params::caddy_log_dir,
  String                         $caddy_tmp_dir    = $caddy::params::caddy_tmp_dir,
  String                         $caddy_ssl_dir    = $caddy::params::caddy_ssl_dir,
  String                         $caddy_home       = $caddy::params::caddy_home,
  Enum['personal', 'commercial'] $caddy_license    = 'personal',
  Enum['on','off']               $caddy_telemetry  = 'off',
  String                         $caddy_features   = 'http.filter,http.git,http.ipfilter',
  Stdlib::Port                   $caddy_http_port  = $caddy::params::caddy_http_port,
  Stdlib::Port                   $caddy_https_port = $caddy::params::caddy_https_port,
  Optional[String[1]]            $caddy_account_id,
  Optional[String[1]]            $caddy_api_key,

  )inherits caddy::params{

  include ::caddy::package
  include ::caddy::config
  include ::caddy::service
}
