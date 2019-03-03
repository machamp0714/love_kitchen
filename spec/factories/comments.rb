FactoryBot.define do
  factory :comment do
    content { "MyString" }
    article { nil }
    user { nil }
  end
end
