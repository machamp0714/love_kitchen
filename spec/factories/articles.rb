FactoryBot.define do
  factory :alice_article, class: Article do
    title { "中華鍋を買って良かった3つのこと" }
    content { "熱伝導が高いこと" }
    association :user, factory: :alice
    created_at { Time.now.zone }
  end

  factory :bob_article, class: Article do
    title { "美味しいトマトソースを作るにはコレ" }
    content { "トマトソースを作るときはいつもこのトマト缶を使っています" }
    association :user, factory: :bob_article
    created_at { 3.days.ago }
  end
end
