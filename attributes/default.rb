node.default['rbenv']['global'] = '2.1.2'
node.default['rbenv']['gem_prefix'] = node['rbenv']['global'].include?('2.1') ? '2.1.0' : '1.9.1'
node.default['passenger']['version'] = '4.0.48'
