FactoryBot.define do
  factory :room do
    name { '美味しいペペロンチーノの作り方募集！' }
    association :user, factory: :alice
  end
end
