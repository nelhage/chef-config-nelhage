directory '/opt/letsencrypt' do
  action :create
  owner 'nelhage'
  group 'nelhage'
end

python_virtualenv '/opt/letsencrypt/venv' do
  user 'nelhage'
  group 'nelhage'
end

file '/opt/letsencrypt/requirements.txt' do
  user 'nelhage'
  group 'nelhage'
  content <<EOF
letsencrypt
EOF
end

pip_requirements '/opt/letsencrypt/requirements.txt' do
  virtualenv '/opt/letsencrypt/venv'
end

directory '/etc/letsencrypt/' do
  action :create
  user 'root'
  group 'root'
end
