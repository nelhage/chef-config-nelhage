describe 'tarsnap::default' do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  it 'installs tarsnap' do
    file("#{node['tarsnap']['bin_dir']}/tarsnap").must_exist
  end

  it 'installs tarsnap-keygen' do
    file("#{node['tarsnap']['bin_dir']}/tarsnap-keygen").must_exist
  end

  it 'installs tarsnap-keymgmt' do
    file("#{node['tarsnap']['bin_dir']}/tarsnap-keymgmt").must_exist
  end

  it 'installs tarsnap-keyregen' do
    file("#{node['tarsnap']['bin_dir']}/tarsnap-keyregen").must_exist
  end

  it 'installs tarsnap-recrypt' do
    file("#{node['tarsnap']['bin_dir']}/tarsnap-recrypt").must_exist
  end

  it 'installs tarsnap.conf' do
    file("#{node['tarsnap']['conf_dir']}/tarsnap.conf").must_exist # .with(:owner, "root").and(:group, 0).and(:mode, 0600)
  end
end
