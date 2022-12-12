require 'securerandom'

class User
  attr_reader :id, :name

  def initialize(name)
    raise ArgumentError.new('nameがnilです。') if name.nil?

    @id = SecureRandom.uuid
    @name = name
  end

  def change_name(name)
    raise ArgumentError.new('nameがnilです。') if name.nil?
    raise ArgumentError.new("ユーザー名は3文字以上です。") if name.size < 3
    @name = name
  end

  def equals?(other)
    self.equal?(other)
  end
end

class UserId
  attr_reader :value

  def initialize(value)
    raise ArgumentError.new('valueがnilです。') if value.nil?
    @value = value
  end
end

class UserName
  attr_reader :value

  def initialize(value)
    raise ArgumentError.new("#{value}") if value.nil?
    raise ArgumentError.new("ユーザー名は3文字以上です。") if value.size < 3
    @value = value
  end
end