require 'helper'

class TestMongoMapperGenerators < GeneratorTestCase
      
  context "running the mongo_model generator" do
    setup do
      run_generator('mongo_model', %w(Person name:string email:string))
    end
    
    should_generate_file 'app/models/person.rb'
  end
end
