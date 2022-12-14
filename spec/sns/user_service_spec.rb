require_relative '../../src/sns/user_service'
require_relative '../../spec/libs/shared_context'

RSpec.describe UserService, "#exists?" do
  context 'DBにuserが存在する' do
    include_context 'usersにデータを登録する'

    it 'trueを返す' do
      expect(described_class.new.exists?(user)).to be_truthy
    end
  end

  context 'DBにuserが存在しない' do
    it 'falseを返す' do
      user = User.new(id: nil, name: 'keisuke')
      expect(described_class.new.exists?(user)).to be_falsey
    end
  end
end