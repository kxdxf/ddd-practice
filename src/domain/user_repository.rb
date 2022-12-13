require 'sqlite3'

class UserRepository
  def save(user)
    sql = 'INSERT INTO users (id, name) VALUES (?, ?) ON CONFLICT (id) DO UPDATE SET name = ?'
    database.execute(sql, user.id, user.name, user.name)
  end

  def find
  end

  def exists?(user)
  end

  private

  def database
    @database ||= SQLite3::Database.new('ddd-practice')
  end
end
