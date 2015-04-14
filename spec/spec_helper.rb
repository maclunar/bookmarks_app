# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] = 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
# require 'rspec/collection_matchers'
require 'factory_girl_rails'
require 'capybara/rspec'
require 'database_cleaner'


# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"


  # Database cleaner
  config.before(:suite) do
    begin
      DatabaseCleaner.clean_with(:truncation)
    rescue Exception => e
      p "*********************************************** #{e}"
    end
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :deletion, DB_TRUNCATION_PARMS
  end

  config.before(:each) do
    Rails.cache.clear
    ActionMailer::Base.deliveries.clear
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    begin
      DatabaseCleaner.clean
    rescue Exception => e
      p "*********************************************** #{e}"
    end
  end


  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller

  config.include Capybara::DSL
end


Capybara.default_driver = :rack_test  #:sauce
