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
      it 'ユーザー名が存在しない場合無効であること' do
        user.name = nil
        expect(user).to_not be_valid
      end

      it 'ユーザー名が４文字以下の場合無効であること' do
        user.name = 'a' * 3
        expect(user).to_not be_valid
      end

      it 'ユーザー名が１２文字以上の場合無効であること' do
        user.name = 'a' * 13
        expect(user).to_not be_valid
      end
    end

    context 'パスワードに対するvalidation' do
      it 'パスワードが８文字以下の場合無効であること' do
        user.password = 'a' * 7
        expect(user).to_not be_valid
      end

      it 'パスワードが１２８文字以上の場合無効であること' do
        user.password = 'a' * 129
        expect(user).to_not be_valid
      end

      it 'パスワードが存在しない場合無効であること' do
        user.password = nil
        expect(user).to_not be_valid
      end
    end

    context 'メールアドレスに対するvalidation' do
      it 'メールアドレスに@が含まれていない場合無効であること' do
        user.email = 'alice.com' 
        expect(user).to_not be_valid
      end

      it 'メールアドレスが存在しない場合無効であること' do
        user.email = nil
        expect(user).to_not be_valid
      end
    end
  end
end
