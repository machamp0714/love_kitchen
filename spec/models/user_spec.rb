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

      it 'ユーザー名が3文字以下の場合無効であること' do
        user.name = 'a' * 2
        expect(user).to_not be_valid
      end
      
      it 'ユーザー名が20文字以上の場合無効であること' do
        user.name = 'a' * 21
        expect(user).to_not be_valid
      end

      it 'ユーザー名に半角英数字以外が使われている場合無効であること' do
        user.name = 'アリス'
        expect(user).to_not be_valid
      end

      it 'ユーザー名が数字のみの場合無効であること' do
        user.name = '1234'
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

      it '確認用パスワードがパスワードと一致しない時無効であること' do
        user.password_confirmation = 'hogehoge'
        expect(user).to_not be_valid
      end
    end

    context 'メールアドレスに対するvalidation' do
      before do
        FactoryBot.create(:bob)
      end
      it 'メールアドレスに@が含まれていない場合無効であること' do
        user.email = 'alice.com' 
        expect(user).to_not be_valid
      end

      it 'メールアドレスが存在しない場合無効であること' do
        user.email = nil
        expect(user).to_not be_valid
      end

      it 'メールアドレスが既に存在している場合無効であること' do
        user.email = 'bob@email.com'
        expect(user).to_not be_valid
      end
    end
    context '自己紹介に対するvalidation' do
      it '自己紹介が200文字以上の場合無効であること' do
        user.introduce = 'a' * 201
        expect(user).to_not be_valid
      end
    end
  end
end
