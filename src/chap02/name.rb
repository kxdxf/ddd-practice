# frozen_string_literal: true

class Name
  attr_reader :value

  def initialize(value)
    raise ArgumentError if value.nil?
    raise ArgumentError unless value.match(/^[a-zA-Z]+$/)

    @value = value
  end
end

class FullName
  def initialize(first_name, last_name)
    raise ArgumentError if first_name.nil?
    raise ArgumentError if last_name.nil?

    @first_name = first_name
    @last_name = last_name
  end
end