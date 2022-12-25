require 'sqlite3'

class User
  attr_reader :id, :name

  def initialize(id, name)
    raise ArgumentError if id.nil? || name.nil?

    @id = id
    @name = name
  end
end

class UserId
  attr_reader :id

  def initialize(id)
    raise ArgumentError if id.nil?

    @id = id
  end
end

class UserFactory
  def self.create(name)
    sql = 'SELECT * FROM SQLITE_SEQUENCE;'
    database.execute(sql)
            .then { |result| result.empty? ? 1 : result[0][0].to_i }
            .then { |seq| UserId.new(seq) }
            .then { |user_id| User.new(user_id, name) }
  end

  private

  def self.database
    SQLite3::Database.new('ddd-practice')
  end
end