require 'spec_helper'

RSpec.describe User do
  let(:user) { User.new(name: 'たろう', age: age) }
  shared_context '12歳の場合' do
    let(:age) { 12 }
  end
  shared_context '13歳の場合' do
    let(:age) { 13 }
  end

  describe '#greet' do
    subject { user.greet }
    shared_examples '子どものあいさつ' do
      it { is_expected.to eq 'ぼくはたろうだよ。' }
    end
    
    context '12歳の場合' do
      include_context '12歳の場合'
      it_behaves_like '子どものあいさつ'
    end

    shared_examples '大人のあいさつ' do
      it { is_expected.to eq '僕はたろうです。' }
    end
    context '13歳の場合' do
      include_context '13歳の場合'
      it_behaves_like '大人のあいさつ'
    end
  end

  describe '#child?' do
    subject { user.child? }

    context '12歳の場合' do
      include_context '12歳の場合'
      it { is_expected.to eq true }
    end
    context '13歳の場合' do
      include_context '13歳の場合'
      it { is_expected.to eq true }
    end
  end
end