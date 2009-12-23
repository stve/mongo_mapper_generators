Given /^I have a new rails app$/ do
  generate_rails_app
end
 
Given /^I have no models$/ do
  remove_models
end
 
When /^I generate a new "([^\"]*)" mongo model$/ do |name|
  generate_mongo_model('mongo_model', [name])  
end
 
When /^I generate a new "([^\"]*)" embedded mongo model$/ do |name|
  generate_mongo_model('embedded_model', [name])  
end

Then /^I should have a model named "([^\"]*)"$/ do |filename|
  model_exists?(filename).should be_true
end

Then /^I should have a unit test named "([^\"]*)"$/ do |filename|
  unit_test_exists?(filename).should be_true
end