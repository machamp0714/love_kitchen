# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    article_id { 1 }
    contributor_id { 1 }
    user { nil }
  end
end
