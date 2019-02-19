node['tak'].each do |name, opts|
  nelhage_service name do
    command ("/home/nelhage/go/bin/taktician playtak " +
             opts.map { |k,v| "-#{k}=#{v}" }.join(" "))
    user 'nelhage'
    sigkill false
    restart_sec 5
    timeout_stop_sec '30m'
  end
end
