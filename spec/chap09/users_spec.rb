require_relative '../../src/chap09/user'

RSpec.describe UserFactory, '.create' do
  let(:database) { SQLite3::Database.new('ddd-practice') }

  context 'usersにuserが存在しない' do
    after do
      sql = 'DELETE FROM users;'
      database.execute(sql)
    end

    it 'Userオブジェクトを生成できること' do
      described_class.create('dummy')
                     .tap do |user|
        expect(user).to be_kind_of(User)
        expect(user.id).to be_kind_of(UserId)
      end
    end
  end

  context 'usersにuserが存在する' do
    before do
      sql = 'INSERT INTO users(name) VALUES(\'dummy\');'
      database.execute(sql)
    end

    after do
      sql = 'DELETE FROM users;'
      database.execute(sql)
    end

    it 'Userオブジェクトが生成できること' do
      described_class.create('dummy')
                     .tap do |user|
        expect(user).to be_kind_of(User)
        expect(user.id).to be_kind_of(UserId)
      end
    end
  end
end