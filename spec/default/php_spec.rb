require 'spec_helper'

describe package('php') do
  it { should be_installed }
end

describe package('php-fpm') do
  it { should be_installed }
end

describe command('php -v') do
  its(:stdout) { should match /^PHP 5\.6\./ }
end

describe 'PHP config parameters' do
  context php_config('date.timezone') do
    its(:value) { should eq 'Asia/Tokyo' }
  end
end
