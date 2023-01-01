# frozen_string_literal: true

class UserName
  attr_reader :value

  def initialize(value)
    raise ArgumentError if value.nil?
    raise ArgumentError if value.size < 3

    @value = value
  end
end

class UserId
  attr_reader :value

  def initialzie(value)
    raise ArgumentError if value.nil?

    @value = value
  end
end

class UserName
  attr_reader :value

  def initialize(value)
    raise ArgumentError if value.nil?

    @value = value
  end
end
