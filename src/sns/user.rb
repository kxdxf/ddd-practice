require 'securerandom'

class User
  attr_reader :id, :name

  def initialize(id = nil, name = nil)
    raise ArgumentError.new('nameがnilです。') if name.nil?

    @id = if id.nil?
            SecureRandom.uuid
          else
            id
          end
    @name = name
  end

  def change_name(name)
    raise ArgumentError.new('nameがnilです。') if name.nil?
    raise ArgumentError.new("ユーザー名は3文字以上です。") if name.size < 3
    @name = name
  end
end
