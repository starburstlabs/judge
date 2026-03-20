ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../spec/dummy/config/environment', __FILE__)

require 'rspec/rails'
require 'factory_bot'
require 'factories/factories'

RSpec.configure do |config|
  config.use_transactional_fixtures = true
end
