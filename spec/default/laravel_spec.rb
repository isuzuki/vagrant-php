require 'spec_helper'

describe port(8080) do
  it { should be_listening }
end

db_user = 'root'
describe command("mysqlshow -u#{db_user}") do
  its(:stdout) { should match /laravel_app/ }
end

