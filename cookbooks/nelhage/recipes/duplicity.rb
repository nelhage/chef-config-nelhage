package 'duplicity' do
  action :install
end

python_pip 'boto' do
  action :install
end
