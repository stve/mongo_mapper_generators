require File.join(File.dirname(__FILE__), "..", "support", "generator_helper")

class MongoModelGenerator < Rails::Generator::NamedBase
  default_options :skip_factories  => false
  
  def manifest
    record do |m|
      m.directory 'app/models'
      m.template 'mongo_model.rb', "app/models/#{file_name}.rb"
      
      m.directory 'test/unit'
      m.template 'unit_test.rb',  File.join('test/unit', class_path, 
                                            "#{file_name}_test.rb")

      unless options[:skip_factories]
        m.directory 'test/factories'
        m.template 'factory.rb', File.join('test/factories', "#{file_name}.rb")
      end
    end
  end
  
  def factory_line(attribute, file_name)
    "#{file_name}.#{attribute.name} #{attribute.default_for_factory}"
  end  

  protected
  
    def attributes
      @attributes ||= @args.collect do |attribute|
        MongoAttribute.new(*attribute.split(":"))
      end    
    end

    def banner
      "Usage: #{$0} #{spec.name} ModelName [field:type, field:type]"
    end

    def add_options!(opt)
      opt.separator ''
      opt.separator 'Options:'
      opt.on("--skip-factories", 
             "Don't generate a factory for this model") { |v| 
        options[:skip_factories] = v 
      }
    end
end