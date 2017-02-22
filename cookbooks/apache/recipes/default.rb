#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package 'httpd' do
  action :install
end

node['apache']['sites'].each do |sitename, data|
  document_root	= "/content/sites/#{sitename}"

  directory document_root do
    mode '0755'
    recursive true
  end
  
  template "/etc/httpd/conf.d/#{sitename}.conf" do
    source 'vhost.erb'
    mode '0644'
    variables(
      :port  => data['port'],
      :domain => data['domain'],
      :document_root => document_root
    )
    notifies :restart, 'service[httpd]'
  end

  template "/content/sites/#{sitename}/index.html" do 
    source 'index.html.erb'
    mode '0644'
    variables(
      :site_title => data['site_title'],
      :coming_soon => 'coming soon !!'
    )
  end
end

execute 'rm /etc/httpd/conf.d/welcome.conf' do
  only_if do
    File.exists?('/etc/httpd/conf.d/welcome.conf')
  end
  notifies :restart, 'service[httpd]'
end

execute 'rm /etc/httpd/conf.d/README' do
  only_if do
    File.exists?('/etc/httpd/conf.d/README')
  end
  notifies :restart, 'service[httpd]'
end

execute 'chcon  --user system_u --type httpd_sys_content_t -Rv /content/' do
end

service 'httpd' do
  action [:enable, :start]
end

include_recipe 'php::default'

