ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)
