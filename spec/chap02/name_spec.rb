# frozen_string_literal: true

require 'rspec'
require_relative '../../src/chap02/name'

RSpec.describe Name, '#initialize' do
  context '引数valueが文字列' do
    it 'インスタンス化できる' do
      expect(Name.new('keisuke')).to be_kind_of(Name)
    end
  end

  context '引数valueがnilである' do
    it '実行時エラーが発生する' do
      expect { described_class.new(nil) }.to raise_error(ArgumentError)
    end
  end

  context '引数に許容されていない文字が含まれる' do
    %w[ke!suke n@kasuga].each do |value|
      it "実行時エラーが発生する value#{value}" do
        expect { described_class.new(value) }.to raise_error(ArgumentError)
      end
    end
  end
end

RSpec.describe FullName, '#initialize' do
  context '引数first_name, last_nameが文字列' do
    it 'インスタンス化できる' do
      expect(described_class.new('keisuke', 'nakasuga')).to be_kind_of(FullName)
    end
  end

  context '引数にnilが含まれる' do
    [[nil, nil],
     ['keisuke', nil],
     [nil, 'nakasuga']].each do |first_name, last_name|
      it '実行時エラーが発生する' do
        expect { described_class.new(first_name, last_name) }.to raise_error(ArgumentError)
      end
    end
  end
end