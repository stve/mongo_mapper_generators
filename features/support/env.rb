$:.unshift(File.dirname(__FILE__) + "/../../rails_generators")
require "rubygems"
require 'mongo_mapper_generators'
require "rails_generator"
require 'rails_generator/scripts/generate'
require "fileutils"
 
web_app_theme_root  = File.join(File.dirname(__FILE__), "/../../")
tmp_rails_app_name  = "tmp_rails_app"
tmp_rails_app_root  = File.join(web_app_theme_root, tmp_rails_app_name)
 
Rails::Generator::Base.prepend_sources Rails::Generator::PathSource.new(:mongo_mapper_generators, File.join(File.dirname(__FILE__), "..", "..", "rails_generators")) 
module GeneratorHelpers
  def generate_rails_app
    FileUtils.mkdir(File.join(@app_root))
  end
 
  def remove_models
    FileUtils.rm_rf(File.join(@app_root, "app", "models"))
  end
  
  def generate_mongo_model(*args)
    options = !args.empty? && args.last.is_a?(Hash) ? args.pop : {}
    options.merge!({:destination => @app_root, :quiet => true})
    args << options
    run_generator(*args)
  end
 
  def model_exists?(filename)
    File.exists?(File.join(@app_root, "app", "models", filename))
  end
 
  def unit_test_exists?(filename)
    File.exists?(File.join(@app_root, "test", "unit", filename))
  end
 
  # Instantiates the Generator.
  def build_generator(name, params, options)
    Rails::Generator::Base.instance(name, params, options)
  end

  # Runs the +create+ command (like the command line does).
  def run_generator(name, params=[], options={})
    silence_generator do
      build_generator(name, params, options).command(:create).invoke!
    end
  end

  # Silences the logger temporarily and returns the output as a String.
  def silence_generator
    logger_original = Rails::Generator::Base.logger
    myout = StringIO.new
    Rails::Generator::Base.logger = Rails::Generator::SimpleLogger.new(myout)
    yield if block_given?
    Rails::Generator::Base.logger = logger_original
    myout.string
  end
 
end
 
Before do
  @app_root = tmp_rails_app_root  
end
 
After do
  FileUtils.rm_rf(tmp_rails_app_root)
end
 
World(GeneratorHelpers)