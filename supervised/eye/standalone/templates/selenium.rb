Eye.application 'selenium' do
  working_dir '/etc/eye'
  stdall '/var/log/eye/selenium-stdall.log'
  trigger :flapping, times: 10, within: 1.minute, retry_in: 3.minutes
  check :cpu, every: 10.seconds, below: 100, times: 3 # global check for all processes

  process :standalone do
    pid_file '/var/run/selenium.pid'
    start_command 'java -jar {{ selenium_dest_dir }}/selenium-server-standalone-latest.jar'
    daemonize true
    stdall '/var/log/eye/selenium-standalone-stdall.log'
    start_timeout 10.seconds
    stop_timeout 5.seconds
  end

end
