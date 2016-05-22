nelhage_service 'taklogger' do
  command '/home/nelhage/code/go/bin/taklogger -out /home/nelhage/code/go/src/github.com/nelhage/taktician/games'
  user 'nelhage'
end

nelhage_service 'taktician' do
  command ("/home/nelhage/code/go/bin/taktician " +
           node['taktician'].map { |k,v| "-#{k}=#{v}" }.join(" "))
  user 'nelhage'
  sigkill false
end
