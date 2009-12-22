require 'rubygems'
require 'ruby-debug'
require 'active_support'
require 'active_record'
require 'action_controller'
require 'action_view'
require 'shoulda'

require File.join(File.dirname(__FILE__), 'shoulda_macros', 'generator_macros')
require File.join(File.dirname(__FILE__), 'stolen_from_railties')

unless defined?(RAILS_DEFAULT_LOGGER)
  @test_log = File.join(RAILS_ROOT, 'test.log')
  RAILS_DEFAULT_LOGGER = Logger.new(@test_log)
end

Rails::Generator::Base.prepend_sources Rails::Generator::PathSource.new(:mongo_mapper_generators, File.join(File.dirname(__FILE__), "..", "rails_generators"))

class GeneratorTestCase
  def run_generator(name, params=[])
    silence_generator do
      build_generator(name, params).command(:create).invoke!
    end
  end
end