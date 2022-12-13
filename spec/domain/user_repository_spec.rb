require_relative '../../src/domain/user'
require_relative '../../src/domain/user_repository'

RSpec.describe UserRepository, "#save" do
  let(:database) { SQLite3::Database.new('ddd-practice') }
  let(:repository) { UserRepository.new }

  context 'DBにuserが存在しない' do
    after do
      sql = "DELETE FROM users"
      database.execute(sql)
    end

    it 'ユーザー情報をDBに登録できること' do
      user = User.new('keisuke')
      repository.save(user)

      sql = 'SELECT * FROM users WHERE id = ?'
      result = database.execute(sql, user.id)

      expect(result.size).to eq(1)
      expect(user.id).to eq(result[0][0])
      expect(user.name).to eq(result[0][1])
    end
  end

  context 'DBにuserが存在する' do
    before do
      user = User.new('keisuke')
      repository.save(user)
    end

    after do
      sql = "DELETE FROM users"
      database.execute(sql)
    end

    it 'ユーザー情報をDBに登録できること' do
    end
  end
end
