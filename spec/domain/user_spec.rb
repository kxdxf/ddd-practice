require_relative '../../src/domain/user'

RSpec.describe UserId, "#initiazize" do
  it 'インスタンス化できること' do
    expect(UserId.new(1)).to be_truthy
  end

  it 'idを取得できること' do
    expect(UserId.new(1).value).to eq(1)
  end

  it '引数がnilの場合はArgumentErrorを発生させる' do
    expect { UserId.new(nil) }.to raise_error(ArgumentError)
  end
end

RSpec.describe User, "#initialize" do
  it 'インスタンス化できること' do
    id = UserId.new(1)
    expect(User.new(id, 'keisuke')).to be_truthy
  end

  it 'Userインスタンスは可変であること' do
    id = UserId.new(1)
    user = User.new(id, 'keisuke')
    user.change_name('nakasuga')
    expect(user.name).to eq('nakasuga')
  end

  it '引数idがnilの場合はArgumentErrorを発生させる' do
    expect { User.new(nil, 'keisuke') }.to raise_error(ArgumentError)
  end

  it '引数nameがnilの場合はArgumentErrorを発生させる' do
    id = UserId.new(1)
    expect { User.new(id, nil) }.to raise_error(ArgumentError)
  end

  it '引数nameが3文字以下の場合はArgumentErrorを発生させる' do
    id = UserId.new(1)
    expect { User.new(id, 'ab') .to raise_error(ArgumentError) }
  end
end

RSpec.describe User, "#equals?" do
  it 'idが同じ場合はtrueを返す' do
    user_a = User.new(UserId.new(1), 'keisuke')
    user_a_cp = user_a
    expect(user_a.equals?(user_a_cp)).to be_truthy
  end

  it 'idが異なる場合はfalseを返す' do
    user_a = User.new(UserId.new(1), 'keisuke')
    user_b = User.new(UserId.new(2), 'keisuke')
    expect(user_a.equals?(user_b)).to be_falsey
  end
end