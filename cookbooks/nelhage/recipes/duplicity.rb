['duplicity', 'eatmydata'].each do |p|
  package p do
    action :install
  end
end

python_pip 'boto' do
  action :install
end

template 'nightly-duplicity' do
  path '/usr/local/bin/nightly-duplicity'
  source 'nightly-duplicity.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

cron_d "duplicity" do
  action :create
  minute "0"
  hour   "12"
  command '/usr/local/bin/nightly-duplicity'
end
