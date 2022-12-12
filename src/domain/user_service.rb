require 'sqlite3'

class UserService
  def self.exists?(user)
    database = SQLite3::Database.new('ddd-practice')
    sql = "SELECT * FROM users WHERE name = :name"
    database.execute(sql, name: user.name).size == 1
  end
end
