require 'helper'

class TestMongoMapperGenerators < GeneratorTestCase
  
  context "running the mongo_model generator" do
    setup do
      run_generator('mongo_model', %w(Person name:string email:string))
    end
    
    should_generate_file 'app/models/person.rb'
    should_generate_file 'test/unit/person_test.rb'
  end

  context "running the embedded_model generator" do
    setup do
      run_generator('embedded_model', %w(Address street:string state:integer city:string zip:string))
    end
    
    should_generate_file 'app/models/address.rb'
    should_generate_file 'test/unit/address_test.rb'
  end
end
