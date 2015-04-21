require 'spec_helper'

describe command('which gulp') do
  its(:exit_status) { should eq 0 }
end
