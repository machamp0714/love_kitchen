# frozen_string_literal: true

require "rails_helper"

RSpec.describe Article, type: :model do

  let(:article) { FactoryBot.build(:alice_article) }

  describe "投稿が無効な場合" do
    it "タイトルが空白の場合無効であること" do
      article.title = ""
      expect(article).to_not be_valid
    end

    it "記事が空白の場合無効であること" do
      article.content = ""
      expect(article).to_not be_valid
    end

    it "ラベル1が空白の場合" do
      article.label1 = ""
      expect(article).to_not be_valid
    end

    it "ラベル2が空白の場合" do
      article.label2 = ""
      expect(article).to_not be_valid
    end

    it "ラベル3が空白の場合" do
      article.label3 = ""
      expect(article).to_not be_valid
    end

    it "ラベル1の文字数が11文字の場合" do
      article.label1 = "a" * 11
      expect(article).to_not be_valid
    end

    it "ラベル2の文字数が11文字の場合" do
      article.label2 = "a" * 11
      expect(article).to_not be_valid
    end

    it "ラベル3の文字数が11文字の場合" do
      article.label3 = "a" * 11
      expect(article).to_not be_valid
    end

    it "ラベル4の文字数が11文字の場合" do
      article.label4 = "a" * 11
      expect(article).to_not be_valid
    end

    it "ラベル5の文字数が11文字の場合" do
      article.label5 = "a" * 11
      expect(article).to_not be_valid
    end

    it "data1が空白の場合" do
      article.data1 = ""
      expect(article).to_not be_valid
    end

    it "data2が空白の場合" do
      article.data2 = ""
      expect(article).to_not be_valid
    end

    it "data3が空白の場合" do
      article.data3 = ""
      expect(article).to_not be_valid
    end
  end

  describe "#set_labels" do
    let(:article) { FactoryBot.create(:alice_article) }
    
    it "articleのラベルの配列を返すこと" do
      expect(article.set_labels).to eq(%w[ラベル1 ラベル2 ラベル3])
    end

    it "articleのデータの配列を返すこと" do
      expect(article.set_data).to eq([1, 2, 3])
    end
  end
end
