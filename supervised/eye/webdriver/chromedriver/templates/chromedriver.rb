Eye.application 'chromedriver' do
  working_dir '/etc/eye'
  stdall '/var/log/eye/chromedriver-stdall.log'
  trigger :flapping, times: 10, within: 1.minute, retry_in: 3.minutes
  check :cpu, every: 10.seconds, below: 100, times: 3 # global check for all processes

  process :chromedriver do
    pid_file '/var/run/chromedriver.pid'
    start_command 'chromedriver'
    stdall '/var/log/eye/chromedriver-stdall.log'
    daemonize true
    start_timeout 10.seconds
    stop_timeout 5.seconds
  end

end