# frozen_string_literal: true

FactoryBot.define do
  factory :room do
    title { "美味しいペペロンチーノの作り方募集！" }
    association :user, factory: :alice
  end
end
