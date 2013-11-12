PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)

require 'simplecov'
SimpleCov.start do
	root(File.join(File.dirname(__FILE__), '..'))
	coverage_dir 'reports/coverage'
	add_filter '/spec/'
  add_filter '/features/'
  add_filter '/admin/'
  add_filter '/db/'
  add_filter '/config/'
  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
  add_group "Helpers", "app/helpers"
end

require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

#RSpec.configure do |conf|
#  conf.include Rack::Test::Methods
#  DataMapper.setup(:default, "abstract::")
#  DataMapper::Logger.new($stdout, :all)
#end

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  DataMapper::Logger.new($stdout, :all)
  DataMapper.auto_migrate!
  user = User.create(:email => 'npaez@gmail.com',
                   :name => 'Nicolas', 
                   :lastname => 'Paez',
                   :is_teacher => true,
                   :password => "1234")
end

def app
  TaskManagement::App.tap { |app|  }
end
