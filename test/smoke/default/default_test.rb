# # encoding: utf-8

# Inspec test for recipe task3_database::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# This is an example test, replace it with your own test.
describe port(3306) do
  it { should be_listening }
end

describe service('mysql-default') do
  it { should be_enabled }
  it { should be_running }
end

describe command('mysql -S /var/run/mysql-default/mysqld.sock -uroot -pP@sswd -e "show databases"') do
  its('stdout') { should match /task3/ }
end
