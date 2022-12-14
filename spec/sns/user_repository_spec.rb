require_relative '../../src/sns/user_repository'
require_relative '../../src/sns/user'
require_relative '../../spec/libs/shared_context'
require 'sqlite3'

RSpec.describe UserRepository, "#find_by_id" do
  context 'DBにuserが存在する' do
    include_context 'usersにデータを登録する'

    it 'ユーザーを1件取得できる' do
      result = described_class.new.find_by_id(user.id)
      expect(result.size).to eq(1)
      expect(result[0][0]).to eq(user.id.value)
      expect(result[0][1]).to eq(user.name)
    end
  end
end

RSpec.describe UserRepository, "#find_by_name" do
  context 'DBにuserが存在する' do
    include_context 'usersにデータを登録する'

    it 'ユーザーを1件取得できる' do
      result = described_class.new.find_by_name(user.name)
      expect(result.size).to eq(1)
      expect(result[0][0]).to eq(user.id.value)
      expect(result[0][1]).to eq(user.name)
    end
  end
end

RSpec.describe UserRepository, "#save" do
  it 'ユーザーを登録できる' do
    user = User.new(id: nil, name: 'keisuke')
    described_class.new.save(user)

    result = described_class.new.find_by_name(user.name)
    expect(result.size).to eq(1)
    expect(result[0][0]).to eq(user.id.value)
    expect(result[0][1]).to eq(user.name)
  end
end