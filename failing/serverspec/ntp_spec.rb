require 'spec_helper'

describe package('ntp') do
  it { should be_installed }
end

describe service('ntp') do
  it { should be_running }
end

describe file('/etc/ntp.conf') do
  it { should contain 'no-server-2.pool.ntp.org' }
  it { should contain 'no-server-1.pool.ntp.org' }
end
