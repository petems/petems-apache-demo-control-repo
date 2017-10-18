# profile::swap - Sets up base sysctl settings
class profile::base::sysctl {

  $sysctl_settings ={
    'fs.protected_hardlinks' => '1',
    'fs.protected_symlinks' => '1',
    'fs.suid_dumpable' => '0',
    'kernel.core_uses_pid' => '1',
    'kernel.ctrl-alt-del' => '0',
    'kernel.dmesg_restrict' => '1',
    'kernel.kptr_restrict' => '2',
    'kernel.randomize_va_space' => '2',
    'kernel.sysrq' => '0',
    'net.ipv4.conf.all.accept_redirects' => '0',
    'net.ipv4.conf.all.accept_source_route' => '0',
    'net.ipv4.conf.all.bootp_relay' => '0',
    'net.ipv4.conf.all.forwarding' => '0',
    'net.ipv4.conf.all.log_martians' => '1',
    'net.ipv4.conf.all.mc_forwarding' => '0',
    'net.ipv4.conf.all.proxy_arp' => '0',
    'net.ipv4.conf.all.rp_filter' => '1',
    'net.ipv4.conf.all.send_redirects' => '0',
    'net.ipv4.conf.default.accept_redirects' => '0',
    'net.ipv4.conf.default.accept_source_route' => '0',
    'net.ipv4.conf.default.log_martians' => '1',
    'net.ipv4.icmp_echo_ignore_broadcasts' => '1',
    'net.ipv4.icmp_ignore_bogus_error_responses' => '1',
    'net.ipv4.tcp_syncookies' => '1',
    'net.ipv4.tcp_timestamps' => '0',
    'net.ipv6.conf.all.accept_redirects' => '0',
    'net.ipv6.conf.all.accept_source_route' => '0',
    'net.ipv6.conf.default.accept_redirects' => '0',
    'net.ipv6.conf.default.accept_source_route' => '0',
  }

  $sysctl_settings.each |$sysctl_setting| {

    sysctl {$sysctl_setting[0]:
      ensure => 'present',
      value  => $sysctl_setting[1],
    }

  }

}
