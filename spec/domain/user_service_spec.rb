require_relative '../../src/domain/user'
require_relative '../../src/domain/user_service'

RSpec.describe UserService, ".exists?" do
  let(:database) { SQLite3::Database.new('ddd-practice') }

  context 'userテーブルにデータが存在する' do
    before do
      sql = "INSERT INTO users(name) VALUES (:name)"
      (1..3).each do |num|
        database.execute(sql, name: "user_#{num}")
      end
    end

    after do
      sql = "DELETE FROM users"
      database.execute(sql)
    end

    it '重複するユーザー名がDBに存在する場合、trueが返却される' do
      user_1 = User.new('user_1')
      expect(described_class.exists?(user_1)).to be(true)
    end

    it '重複するユーザー名がDBに存在しない場合、falseが返却される' do
      user_10 = User.new('user_10')
      expect(described_class.exists?(user_10)).to be(false)
    end
  end
end