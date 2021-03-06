# encoding: utf-8
# author: Mesaguy

describe file('/opt/prometheus/scripts/ntpd_metrics.py') do
    it { should be_file }
    it { should be_executable }
    its('content') { should match /Description: Extract NTPd metrics from ntpq -np/ }
    its('size') { should > 3000 }
    its('mode') { should cmp '0555' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'prometheus' }
end
