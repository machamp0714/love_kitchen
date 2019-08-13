# frozen_string_literal: true

FactoryBot.define do
  factory :relationship do
    association :followed, factory: :bob
    association :follower, factory: :alice
  end
end
