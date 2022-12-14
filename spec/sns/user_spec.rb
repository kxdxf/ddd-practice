require_relative '../../src/sns/user'

RSpec.describe User, "#initialize" do
  context '引数idがnil' do
    it 'インスタンス化できること' do
      expect(described_class.new(nil, 'keisuke')).to be_truthy
    end

    it 'Userインスタンスは可変であること' do
      user = described_class.new(nil, 'keisuke')
      user.change_name('nakasuga')
      expect(user.name).to eq('nakasuga')
    end

    it '引数nameがnilの場合はArgumentErrorを発生させる' do
      expect { described_class.new(nil, nil) }.to raise_error(ArgumentError)
    end

    it 'idとしてUserIdオブジェクトが取得できること' do
      expect(described_class.new(id: nil, name: 'keisuke').id).to be_kind_of(UserId)
    end
  end
end