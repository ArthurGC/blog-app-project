FactoryBot.define do
  factory :post do
    title { Faker::FunnyName.name }
    text { Faker::Lorem.sentence(word_count: 20) }
    comments_counter { Faker::Number.within(range: 1..10) }
    likes_counter { Faker::Number.within(range: 1..10) }
    author_id { Faker::Number.within(range: 1..10) }
  end
end
