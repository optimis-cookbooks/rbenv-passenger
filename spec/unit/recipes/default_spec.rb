require 'chefspec'
require 'chefspec/berkshelf'

describe 'rbenv-passenger' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['rbenv']['global'] = '2.1.2'
    end.converge described_recipe
  end

  before do
    stub_command '/usr/sbin/apache2 -t'
  end

  it 'should load the rbenv resource' do
    expect(chef_run).to include_recipe 'rbenv'
  end

  # https://github.com/fnichol/chef-rbenv/pull/92
  pending 'should install the passenger gem' do
    expect(chef_run).to install_rbenv_gem 'passenger'
  end

  it 'should load the apache resource' do
    expect(chef_run).to include_recipe 'apache2'
  end

  it 'should configure the passenger module' do
    expect(chef_run).to render_file '/etc/apache2/mods-available/passenger.conf'
  end

  pending 'should install the apache module' do
    expect(chef_run).to install_apache_module 'passenger'
  end
end
