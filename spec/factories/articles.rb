FactoryBot.define do
  factory :article do
    title { "MyString" }
    content { "MyText" }
    picture { "MyString" }
    user { nil }
  end
end
