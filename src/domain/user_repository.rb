require_relative '../../src/domain/user'
require 'sqlite3'

class UserRepository
  def save(user)
    sql = 'INSERT INTO users (id, name) VALUES (?, ?) ON CONFLICT (id) DO UPDATE SET name = ?'
    database.execute(sql, user.id, user.name, user.name)
  end

  def find(name)
    sql = 'SELECT * FROM users WHERE name = ?'
    database.execute(sql, name).then do |result|
      result.empty? ? nil : User.new(result[0][0], result[0][1])
    end
  end

  def exists?(user)
  end

  private

  def database
    @database ||= SQLite3::Database.new('ddd-practice')
  end
end
