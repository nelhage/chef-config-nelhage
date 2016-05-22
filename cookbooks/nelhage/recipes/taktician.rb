nelhage_service 'taklogger' do
  command '/home/nelhage/code/go/bin/taklogger -out /home/nelhage/code/go/src/github.com/nelhage/taktician/games'
  user 'nelhage'
end

nelhage_service 'taktician' do
  command [
    "/home/nelhage/code/go/bin/taktician",
    "-debug #{node['taktician']['debug']}",
    "-depth #{node['taktician']['depth']}",
    "-time #{node['taktician']['time']}",
    "-user #{node['taktician']['user']}",
    "-pass #{node['taktician']['password']}",
    "-size #{node['taktician']['size']}"
  ].join(' ')
  user 'nelhage'
end
