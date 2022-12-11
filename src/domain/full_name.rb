class FullName
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def equal?(other)
    first_name == other.first_name && last_name == other.last_name
  end
end
