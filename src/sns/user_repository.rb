require 'sqlite3'

class UserRepository
  def find_by_id(id)
    sql = 'SELECT * FROM users WHERE id = ?'
    database.execute(sql, id.value)
  end

  def find_by_name(name)
    sql = 'SELECT * FROM users WHERE name = ?'
    database.execute(sql, name)
  end

  def save(user)
    sql = 'INSERT INTO users (id, name) VALUES (?, ?) ON CONFLICT (id) DO UPDATE SET name = ?'
    database.execute(sql, user.id.value, user.name, user.name)
  end

  private

  def database
    @database ||= SQLite3::Database.new('ddd-practice')
  end
end
