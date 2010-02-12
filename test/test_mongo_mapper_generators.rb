require 'helper'

class TestMongoMapperGenerators < GeneratorTestCase
  
  context "running the mongo_initializer generator" do
    setup do
      run_generator('mongo_initializer')
    end
    
    should_generate_file 'config/initializers/mongomapper.rb'
    should_generate_file 'config/mongodb.yml'
  end
  
  context "running the mongo_model generator" do
    
    context "with factories" do    
      setup do
        run_generator('mongo_model', %w(Person name:string email:string many:addresses index:email belongs_to:corporation))
      end
    
      should_generate_file 'app/models/person.rb'
      should_generate_file 'test/unit/person_test.rb'
      should_generate_file 'test/factories/people.rb'
    end
    
    context "without factories" do
      setup do
        run_generator('mongo_model', %w(Person name:string email:string many:addresses index:email belongs_to:corporation --skip-factories))
      end
    
      should_generate_file 'app/models/person.rb'
      should_generate_file 'test/unit/person_test.rb'
      should_not_generate_file 'test/factories/people.rb'
    end
  end

  context "running the embedded_model generator" do
    setup do
      run_generator('embedded_model', %w(Address street:string state:integer city:string zip:string))
    end
    
    should_generate_file 'app/models/address.rb'
    should_generate_file 'test/unit/address_test.rb'
    should_generate_file 'test/factories/addresses.rb'
  end
end
