FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    bio { Faker::Lorem.sentence(word_count: 3) }
    password { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
  end
end
