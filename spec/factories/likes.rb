# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    association :user, factory: :alice
    association :article, factory: :bob_article
  end
end
