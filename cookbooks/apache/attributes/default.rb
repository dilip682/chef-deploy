default['apache']['sites']['dilip-huddar2'] = { 'site_title' => 'Huddar2 site coming soon..!', 'port' => '80', 'domain' => 'dilip-huddar2.mylabserver.com' }
default['apache']['sites']['dilip-huddar2b'] = { 'site_title' => 'Huddar2b site coming soon..!', 'port' => '80', 'domain' => 'dilip-huddar2b.mylabserver.com' }
default['apache']['sites']['dilip-huddar3'] = { 'site_title' => 'Huddar3 site coming soon..!', 'port' => '80', 'domain' => 'dilip-huddar3.mylabserver.com' }
default['apache']['sites']['dilip-huddar3b'] = { 'site_title' => 'Huddar3b site coming soon..!', 'port' => '80', 'domain' => 'dilip-huddar3b.mylabserver.com' }
default['apache']['sites']['dilip-huddar4'] = { 'site_title' => 'Huddar4 site coming soon..!', 'port' => '80', 'domain' => 'dilip-huddar4.mylabserver.com' }
default['apache']['sites']['dilip-huddar4b'] = { 'site_title' => 'Huddar4b site coming soon..!', 'port' => '80', 'domain' => 'dilip-huddar4b.mylabserver.com' }

default['author']['name'] = 'Dilip'

case node['platform']
when 'centos'
  default['apache']['package'] = 'httpd'
when 'ubuntu'
  default['apache']['package'] = 'apache2'
end
