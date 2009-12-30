class Test::Unit::TestCase
  class << self
    
    def should_generate_file(file, &block)
      should "generate file #{file}" do
        yield("foo") if block_given?
        assert_generated_file(file)
      end
    end
    
    def should_not_generate_file(file)
      should "not generate file #{file}" do
        assert !File.exists?(file),"The file '#{file}' should not exist"
      end
    end

  end
end
