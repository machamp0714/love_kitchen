FactoryBot.define do
  factory :test, class: Article do
    title { "中華鍋を買って良かった3つのこと" }
    content { "熱伝導が高いこと" }
    association :user, factory: :alice
    created_at { Time.now.zone }
  end
end
