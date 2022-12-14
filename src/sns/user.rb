require 'securerandom'

class User
  attr_reader :id, :name

  def initialize(id:, name:)
    raise ArgumentError.new('nameがnilです。') if name.nil?

    @id = if id.nil?
            UserId.new(SecureRandom.uuid)
          else
            UserId.new(id)
          end
    @name = name
  end

  def change_name(name)
    raise ArgumentError.new('nameがnilです。') if name.nil?
    raise ArgumentError.new("ユーザー名は3文字以上です。") if name.size < 3
    @name = name
  end
end

class UserId
  attr_reader :value

  def initialize(value)
    raise ArgumentError.new("valueがnullまたは空文字です。") if value.nil? || value.empty?
    @value = value
  end
end

