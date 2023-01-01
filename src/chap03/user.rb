# frozen_string_literal: true

class UserId
  attr_reader :value

  def initialize(value)
    raise ArgumentError if value.nil?

    @value = value
  end
end

class User
  attr_reader :id, :name

  def initialize(id, name)
    raise ArgumentError if id.nil?
    raise ArgumentError if name.nil?

    @id = id
    change_user_name(name)
  end

  def change_user_name(name)
    raise ArgumentError if name.nil?
    raise ArgumentError if name.length < 3

    @name = name
  end

  def equals?(other)
    self == other
  end
end
