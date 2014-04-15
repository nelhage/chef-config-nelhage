include_recipe "nelhage"

include_recipe "nelhage::websites"
include_recipe "nelhage::gitolite"
include_recipe "nelhage::money"
include_recipe "nelhage::party-zephyr"
include_recipe "nelhage::tarsnap"

include_recipe "nelhage::packages"

sysctl_param 'kernel.yama.ptrace_scope' do
  value '0'
end
