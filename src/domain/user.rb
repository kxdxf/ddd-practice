require 'securerandom'

class User
  attr_reader :id, :name

  def initialize(id, name)
    raise ArgumentError.new('nameがnilです。') if name.nil?
    raise ArgumentError.new('ユーザー名は3文字以上です。') if name.size < 3

    @id = id.nil? ? SecureRandom.uuid : id
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