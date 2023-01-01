# frozen_string_literal: true

require 'rspec'
require_relative '../../src/chap03/user'

RSpec.describe User, "#initialize" do
  context '引数id, nameが文字列' do
    it 'インスタンス化できる' do
      expect(described_class.new(UserId.new(1), 'keisuke')).to be_kind_of(User)
    end
  end

  context '引数にnilが含まれる' do
    [[nil, 'keisuke'],
     [UserId.new(1), nil]].each do |id, name|
      it '実行時エラーが発生する' do
        expect { described_class.new(id, name) }.to raise_error(ArgumentError)
      end
    end
  end

  context '引数nameが3文字未満' do
    %w[ke k].each do |name|
      it '実行時エラーが発生する' do
        expect { described_class.new(UserId.new(1), name) }.to raise_error(ArgumentError)
      end
    end
  end

  context 'name属性を変更できる' do
    it '変更後の属性を取得できること' do
      user = User.new(UserId.new(1), 'keisuke')
      user.change_user_name('keisuke v2')

      expect(user.name).to eq('keisuke v2')
    end
  end
end