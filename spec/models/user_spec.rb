require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザーが有効な場合' do
    let(:user) { FactoryBot.build(:alice) }
    it '有効であること' do
      expect(user).to be_valid
    end

    it '保存される前にname属性が小文字に変換されること' do
      user.name = 'ALICE'
      user.save
      expect(user.name).to eq 'alice'
    end
  end

  describe 'ユーザーが無効な場合' do
    let(:user) { FactoryBot.build(:alice) }
    context 'ユーザー名に対するvalidation' do
      before do
        FactoryBot.create(:bob)
      end
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

      it 'ユーザー名が既に存在している場合無効であること' do
        user.name = 'bob'
        expect(user).to_not be_valid
      end

      it '大文字と小文字を区別しないこと' do
        user.name = 'BOB'
        expect(user).to_not be_valid
      end

      it 'NGワードが含まれている場合無効であること' do
        WORDS = %w{
          index home new create edit update destroy session signin signout login logout
          signup email mail password registration unlock confirmation omniauth article
          comment favorite like page relationship user flash following follower helper
          html http http rspec gem gemfile json query delete remove nil config mysql 
        }
        WORDS.each do |w|
          user.name = w
          expect(user).to_not be_valid
        end
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

  describe 'followingの関連メソッドのテスト' do
    let(:user) { FactoryBot.create(:alice) }
    let(:other_user) { FactoryBot.create(:bob) }
    it 'follow/unfollowできること' do
      expect(user.following?(other_user)).to eq false
      user.follow(other_user)
      expect(other_user.followers).to include user
      expect(user.following?(other_user)).to eq true
      user.unfollow(other_user)
      expect(user.following?(other_user)).to eq false
    end
  end

  describe '他のユーザーをフォローしている場合' do
    let(:alice) { FactoryBot.create(:alice) }
    let(:bob) { FactoryBot.create(:bob) }
    let(:carol) { FactoryBot.create(:carol) }
    let!(:alice_article) { FactoryBot.create(:alice_article, user: alice) }
    let!(:bob_article) { FactoryBot.create(:bob_article, user: bob) }
    let!(:carol_article) { FactoryBot.create(:carol_article, user: carol) }
    before do
      FactoryBot.create(:relationship, followed: bob, follower: alice)
    end
    it 'タイムラインが表示されること' do
      expect(alice.feed).to include bob_article
      expect(alice.feed).to include alice_article
      expect(alice.feed).to_not include carol_article
    end
  end
end
