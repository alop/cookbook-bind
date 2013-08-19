case platform
when "fedora", "redhat", "centos"
  default['bind']['package'] = "bind"
  default['bind']['conf_dir'] = "/var/named"
  default['bind']['service'] = "named"
when "ubuntu"
  default['bind']['package'] = "bind9"
  default['bind']['conf_dir'] = "/etc/bind"
  default['bind']['service'] = "bind9"
end
default['bind']['config'] = default['bind']['conf_dir']"/named.conf"
