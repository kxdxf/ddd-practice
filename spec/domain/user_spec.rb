require_relative '../../src/domain/user'

RSpec.describe User, "#initialize" do
  it 'インスタンス化できること' do
    expect(described_class.new('keisuke')).to be_truthy
  end

  it 'Userインスタンスは可変であること' do
    user = described_class.new('keisuke')
    user.change_name('nakasuga')
    expect(user.name).to eq('nakasuga')
  end

  it '引数nameがnilの場合はArgumentErrorを発生させる' do
    expect { described_class.new(nil) }.to raise_error(ArgumentError)
  end

  it '引数nameが3文字以下の場合はArgumentErrorを発生させる' do
    expect { described_class.new('ab') .to raise_error(ArgumentError) }
  end
end

RSpec.describe User, "#equals?" do
  it 'idが同じ場合はtrueを返す' do
    user_a = described_class.new('keisuke')
    user_a_cp = user_a
    expect(user_a.equals?(user_a_cp)).to be_truthy
  end

  it 'idが異なる場合はfalseを返す' do
    user_a = described_class.new('keisuke')
    user_b = described_class.new('keisuke')
    expect(user_a.equals?(user_b)).to be_falsey
  end
end


RSpec.describe UserId, "#initiazize" do
  it 'インスタンス化できること' do
    expect(described_class.new(1)).to be_truthy
  end

  it 'idを取得できること' do
    expect(described_class.new(1).value).to eq(1)
  end

  it '引数がnilの場合はArgumentErrorを発生させる' do
    expect { described_class.new(nil) }.to raise_error(ArgumentError)
  end
end


RSpec.describe UserName, "#initialize" do
  it 'インスタンス化できること' do
    expect(described_class.new('kei')).to be_truthy
  end

  it '引数valueがnilの場合はArgumentErrorを発生させる' do
    expect { described_class.new(nil) }.to raise_error(ArgumentError)
  end

  it '引数valueが3文字未満の場合はArgumentErrorを発生させる' do
    %w[a aa].each do |value|
      expect { described_class.new(value) }.to raise_error(ArgumentError)
    end
  end
end