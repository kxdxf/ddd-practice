require_relative '../../src/domain/user'

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

    it '引数nameが3文字以下の場合はArgumentErrorを発生させる' do
      expect { described_class.new(nil, 'ab') }.to raise_error(ArgumentError)
    end
  end
end

RSpec.describe User, "#equals?" do
  it 'idが同じ場合はtrueを返す' do
    user_a = described_class.new(nil, 'keisuke')
    user_a_cp = user_a
    expect(user_a.equals?(user_a_cp)).to be_truthy
  end

  it 'idが異なる場合はfalseを返す' do
    user_a = described_class.new(nil, 'keisuke')
    user_b = described_class.new(nil, 'keisuke')
    expect(user_a.equals?(user_b)).to be_falsey
  end
end