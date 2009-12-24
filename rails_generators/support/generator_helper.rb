class MongoAttribute
  attr_accessor :name, :type
  
  def initialize(name, type)
    @name, @type = name, type.capitalize
  end
end