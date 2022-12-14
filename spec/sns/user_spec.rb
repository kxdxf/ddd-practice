require_relative '../../src/sns/user'

RSpec.describe User, "#initialize" do
  context '引数idがnil' do
    it 'インスタンス化できること' do
      expect(described_class.new(id: nil, name: 'keisuke')).to be_truthy
    end

    it 'Userインスタンスは可変であること' do
      user = described_class.new(id: nil, name: 'keisuke')
      user.change_name('nakasuga')
      expect(user.name).to eq('nakasuga')
    end

    it '引数nameがnilの場合はArgumentErrorを発生させる' do
      expect { described_class.new(id: nil, name: nil) }.to raise_error(ArgumentError)
    end

    it 'idとしてUserIdオブジェクトが取得できること' do
      expect(described_class.new(id: nil, name: 'keisuke').id).to be_kind_of(UserId)
    end
  end
end

RSpec.describe UserId, "#initialize" do
  context '引数がnil' do
    it 'ArgumentErrorを発生させる' do
      expect { described_class.new(nil) }.to raise_error(ArgumentError)
    end
  end

  context '引数が空文字' do
    it 'ArgumentErrorを発生させる' do
      expect { described_class.new("") }.to raise_error(ArgumentError)
    end
  end

  context '引数がid文字列' do
    it 'インスタンス化できる' do
      expect(described_class.new('dummy')).to be_kind_of(UserId)
    end
  end
end

RSpec.describe UserName do
  context '引数valueがnil' do
    it 'ArgumentErrorを発生させる' do
      expect { described_class.new(nil) }.to raise_error(ArgumentError)
    end
  end

  context '引数valueが3文字未満' do
    it 'ArgumentErrorを発生させる' do
      expect { described_class.new('dd') }.to raise_error(ArgumentError)
    end
  end
end