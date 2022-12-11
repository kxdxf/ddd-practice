require_relative '../../src/domain/user'

RSpec.describe User, "#initialize" do
  it 'インスタンス化できること' do
    expect(User.new('keisuke')).to be_truthy
  end

  it 'Userインスタンスは可変であること' do
    user = User.new('keisuke')
    user.change_name('nakasuga')
    expect(user.name).to eq('nakasuga')
  end

  it '引数がnilの場合はArgumentErrorを発生させる' do
    expect { User.new(nil) }.to raise_error(ArgumentError)
  end

  it '引数が3文字以下の場合はArgumentErrorを発生させる' do
    expect { User.new('ab') .to raise_error(ArgumentError) }
  end
end