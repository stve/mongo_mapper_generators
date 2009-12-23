require 'test_helper'

class <%= class_name %>Test < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:<%= file_name -%>)
  end
end
