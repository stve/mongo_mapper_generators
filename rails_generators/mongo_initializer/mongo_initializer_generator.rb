class MongoInitializerGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory 'config'
      m.directory 'config/initializers'
      
      m.file 'database.yml', "config/database.yml"      
      m.template 'initializer.rb', "config/initializers/mongodb.rb"
    end
  end
end