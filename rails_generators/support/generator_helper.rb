class MongoAttribute
  attr_accessor :name, :type
  
  def initialize(name, type)
    @name, @type = name, type
  end
  
  def type
    case @name
    when 'many'
      @type.tableize
    when 'index', 'belongs_to'
      @type.downcase
    else
      @type.capitalize
    end
  end
  
  def default_for_factory
    @default ||= case @type.downcase.to_sym
      when :integer                     then "{ 1 }"
      when :float                       then "{ 1.5 }"
      when :decimal                     then "{ 9.99 }"
      when :datetime, :timestamp, :time then "{ Time.now.to_s(:db) }"
      when :date                        then "{ Date.today.to_s(:db) }"
      when :string                      then "{ 'string' }"
      when :text                        then "{ 'text' }"
      when :boolean                     then "{ false }"
      else
        ""
    end
  end
end
