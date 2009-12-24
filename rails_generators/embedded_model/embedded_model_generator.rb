require File.join(File.dirname(__FILE__), "..", "support", "generator_helper")

class EmbeddedModelGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.directory 'app/models'
      m.template 'embedded_model.rb', File.join('app/models', class_path, 
                                            "#{file_name}.rb")
      
      m.directory 'test/unit'
      m.template 'unit_test.rb', File.join('test/unit', class_path, 
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
