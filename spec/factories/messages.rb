FactoryBot.define do
  factory :message do
    content { "MyText" }
    user { nil }
    room { nil }
  end
end
