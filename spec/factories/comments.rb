FactoryBot.define do
  factory :alice_comment, class: Comment do
    content { '1ゲット' }
    association :article, factory: :alice_article
    association :user, factory: :alice
    created_at { Time.zone.now }
  end
end
