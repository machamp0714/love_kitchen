FactoryBot.define do
  factory :alice, class: User do
    name { 'alice' }
    email { 'alice@email.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :bob, class: User do
    name { 'bob' }
    email { 'bob@email.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :carol, class: User do
    name { 'carol' }
    email { 'carol@email.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
