require_relative '../../src/domain/name'

RSpec.describe FullName, "#initialize" do
  it 'インスタンス化できること' do
    fullname = FullName.new(Name.new('keisuke'), Name.new('nakasuga'))
    expect(fullname).to be_truthy
  end

  it 'first nameを取得できること' do
    fullname = FullName.new(Name.new('keisuke'), Name.new('nakasuga'))
    expect(fullname.first_name.value).to eq('keisuke')
  end

  it 'last nameを取得できること' do
    fullname = FullName.new(Name.new('keisuke'), Name.new('nakasuga'))
    expect(fullname.last_name.value).to eq('nakasuga')
  end
end

RSpec.describe FullName, "#equals?" do
  it 'first_name, last_nameが等しい場合はtrueを返す' do
    fullname_a = FullName.new(Name.new('keisuke'), Name.new('nakasuga'))
    fullname_b = FullName.new(Name.new('keisuke'), Name.new('nakasuga'))
    expect(fullname_a.equals?(fullname_b)).to be_truthy
  end

  it 'first_nameが異なる場合はfalseを返す' do
    fullname_a = FullName.new(Name.new('keisuke'), Name.new('nakasuga'))
    fullname_b = FullName.new(Name.new('k'), Name.new('nakasuga'))
    expect(fullname_a.equals?(fullname_b)).to be_falsey
  end

  it 'last_nameが異なる場合はfalseを返す' do
    fullname_a = FullName.new(Name.new('keisuke'), Name.new('nakasuga'))
    fullname_b = FullName.new(Name.new('keisuke'), Name.new('n'))
    expect(fullname_a.equals?(fullname_b)).to be_falsey
  end
end

RSpec.describe Name, "#initialize" do
  it 'インスタンス化できること' do
    %w[keisuke nakasuga].each do |value|
      expect(Name.new(value)).to be_truthy
    end
  end

  it '引数がnilの場合はArgumentErrorを発生させる' do
    expect{ Name.new(nil) }.to raise_error(ArgumentError)
  end

  it '引数に入力不可な文字が含まれている場合はArgumentErrorを発生させる' do
    expect{ Name.new('n@kasuga') }.to raise_error(ArgumentError)
  end
end