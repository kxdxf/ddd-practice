require_relative '../../src/sns/user_repository'
require_relative '../../src/sns/user'

RSpec.shared_context 'usersにデータを登録する' do
  let(:database) { SQLite3::Database.new('ddd-practice') }
  let(:user) { User.new(id: nil, name: 'keisuke') }

  before do
    UserRepository.new.save(user)
  end

  after do
    sql = "DELETE FROM users"
    database.execute(sql)
  end
end