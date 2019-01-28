require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryBot.build(:alice) }

  describe 'ユーザーが有効な場合' do
    it '有効であること' do
      expect(user).to be_valid
    end
  end

  describe 'ユーザーが無効な場合' do
    context 'ユーザー名に対するvalidation' do
      it 'ユーザー名が空白の場合無効であること' do
        user.name = nil
        expect(user).to_not be_valid
      end

      it 'ユーザー名が３文字以下の場合無効であること' do
        user.name = 'a' * 3
        expect(user).to_not be_valid
      end

      it 'ユーザー名が１１文字以上の場合無効であること' do
        user.name = 'a' * 11
        expect(user).to_not be_valid
      end
    end
  end
end
