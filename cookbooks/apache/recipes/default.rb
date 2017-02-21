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

end

service 'httpd' do
  action [:enable, :start]
end
