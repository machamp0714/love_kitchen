FactoryBot.define do
  factory :alice, class: User do
    name { 'alice' }
    email { 'alice@email.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
