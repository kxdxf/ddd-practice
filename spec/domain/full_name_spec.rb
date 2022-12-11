require_relative '../../src/domain/full_name'

RSpec.describe FullName, "#initialize" do
  it 'インスタンスを初期化できること' do
    fullname = FullName.new('keisuke', 'nakasuga')

    expect(fullname).to be_truthy
  end

  it 'first nameを取得できること' do
    fullname = FullName.new('keisuke', 'nakasuga')

    expect(fullname.first_name).to eq('keisuke')
  end

  it 'last nameを取得できること' do
    fullname = FullName.new('keisuke', 'nakasuga')

    expect(fullname.last_name).to eq('nakasuga')
  end
end

RSpec.describe FullName, "#equal?" do
  it 'first_name, last_nameが等しい場合はtrueを返す' do
    fullname_a = FullName.new('keisuke', 'nakasuga')
    fullname_b = FullName.new('keisuke', 'nakasuga')

    expect(fullname_a.equal?(fullname_b)).to be_truthy
  end

  it 'first_nameが異なる場合はfalseを返す' do
    fullname_a = FullName.new('keisuke', 'nakasuga')
    fullname_b = FullName.new('k', 'nakasuga')

    expect(fullname_a.equal?(fullname_b)).to be_falsey
  end

  it 'last_nameが異なる場合はfalseを返す' do
    fullname_a = FullName.new('keisuke', 'nakasuga')
    fullname_b = FullName.new('keisuke', 'n')

    expect(fullname_a.equal?(fullname_b)).to be_falsey
  end
end