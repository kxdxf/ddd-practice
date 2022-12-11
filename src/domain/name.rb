class FullName
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def equals?(other)
    first_name.value == other.first_name.value &&
      last_name.value == other.last_name.value
  end
end

class Name
  attr_reader :value

  def initialize(value)
    raise ArgumentError.new("#{value}") if value.nil?
    raise ArgumentError.new("許可されていない文字が使われています。") unless value.match(/^[a-zA-Z]+$/)
    @value = value
  end
end