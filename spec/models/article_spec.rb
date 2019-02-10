require 'rails_helper'

RSpec.describe Article, type: :model do
  
  let(:article) { FactoryBot.build(:alice_article) }

  describe '投稿が無効な場合' do
    it 'タイトルが空白の場合無効であること' do
      article.title = ""
      expect(article).to_not be_valid
    end

    it '記事が空白の場合無効であること' do
      article.content = ""
      expect(article).to_not be_valid
    end
  end
end
