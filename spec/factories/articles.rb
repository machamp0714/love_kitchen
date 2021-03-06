# frozen_string_literal: true

FactoryBot.define do
  factory :alice_article, class: Article do
    title { "中華鍋を買って良かった3つのこと" }
    content { "熱伝導が高いこと" }
    association :user, factory: :alice
    label1 { "ラベル1" }
    label2 { "ラベル2" }
    label3 { "ラベル3" }
    data1 { 1 }
    data2 { 2 }
    data3 { 3 }
    created_at { Time.now.zone }

    with_default_picture

    trait :with_default_picture do
      after :create do |article|
        image = Rails.root.join("spec", "fixtures", "love_kitchen.png")
        article.pictures << FactoryBot.create(:picture, image: Rack::Test::UploadedFile.new(image), article_id: article.id)
      end
    end
  end

  factory :max_uploaded_article, class: Article do
    title { "写真がいっぱい" }
    content { "熱伝導が高いこと" }
    association :user, factory: :alice
    label1 { "ラベル1" }
    label2 { "ラベル2" }
    label3 { "ラベル3" }
    data1 { 1 }
    data2 { 2 }
    data3 { 3 }
    created_at { Time.now.zone }

    after :create do |article|
      image_1 = Rails.root.join("spec", "fixtures", "love_kitchen.png")
      image_2 = Rails.root.join("spec", "fixtures", "star-off.png")
      image_3 = Rails.root.join("spec", "fixtures", "star-on.png")

      article.pictures << FactoryBot.create(:picture, image: Rack::Test::UploadedFile.new(image_1), article_id: article.id)
      article.pictures << FactoryBot.create(:picture, image: Rack::Test::UploadedFile.new(image_2), article_id: article.id)
      article.pictures << FactoryBot.create(:picture, image: Rack::Test::UploadedFile.new(image_3), article_id: article.id)
    end
  end

  factory :bob_article, class: Article do
    title { "美味しいトマトソースを作るにはコレ" }
    content { "トマトソースを作るときはいつもこのトマト缶を使っています" }
    association :user, factory: :bob
    label1 { "ラベル1" }
    label2 { "ラベル2" }
    label3 { "ラベル3" }
    data1 { 1 }
    data2 { 2 }
    data3 { 3 }
    created_at { 3.days.ago }
  end

  factory :carol_article, class: Article do
    title { "包丁ランキング" }
    content { "包丁ランキング" }
    association :user, factory: :carol
    label1 { "ラベル1" }
    label2 { "ラベル2" }
    label3 { "ラベル3" }
    data1 { 1 }
    data2 { 2 }
    data3 { 3 }
    created_at { 1.year.ago }
  end
end
