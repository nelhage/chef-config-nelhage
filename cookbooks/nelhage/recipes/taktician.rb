nelhage_service 'taklogger' do
  command '/home/nelhage/code/go/bin/taklogger -out /home/nelhage/code/go/src/github.com/nelhage/taktician/games -index /home/nelhage/code/go/src/github.com/nelhage/taktician/games/games.db'
  user 'nelhage'
  restart_sec 5
end

node['tak'].each do |name, opts|
  nelhage_service name do
    command ("/home/nelhage/code/go/bin/taktician " +
             opts.map { |k,v| "-#{k}=#{v}" }.join(" "))
    user 'nelhage'
    sigkill false
    restart_sec 5
    timeout_stop_sec '30m'
  end
end
