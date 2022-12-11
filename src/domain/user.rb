class User
  attr_reader :name

  def initialize(name)
    change_name(name)
  end

  def change_name(name)
    raise ArgumentError.new('nameがnilです。') if name.nil?
    raise ArgumentError.new("ユーザー名は3文字以上です。") if name.size < 3
    @name = name
  end
end
