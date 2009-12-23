class MongoModelGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.directory 'app/models'
      m.template 'mongo_model.rb', "app/models/#{file_name}.rb"
      
      m.directory 'test/unit'
      m.template 'unit_test.rb',  File.join('test/unit', class_path, 
                                            "#{file_name}_test.rb")
    end
  end
  
  protected
  
    def attributes
      @attributes ||= @args.collect do |attribute|
        MongoAttribute.new(*attribute.split(":"))
      end    
    end
end

class MongoAttribute
  attr_accessor :name, :type
  
  def initialize(name, type)
    @name, @type = name, type.capitalize
  end
end