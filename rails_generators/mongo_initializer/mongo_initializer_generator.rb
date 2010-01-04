class MongoInitializerGenerator < Rails::Generator::Base
  attr :file_name 
  
  def initialize(runtime_args, runtime_options = {})
    super
    @file_name = @args.first || 'default'
  end

  def manifest
    record do |m|
      m.directory 'config'
      m.directory 'config/initializers'

      m.template 'database.yml', "config/database.yml"
      m.template 'initializer.rb', "config/initializers/mongodb.rb"      
    end
  end
end