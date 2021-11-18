FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.sentence(word_count: 10) }
    author_id { Faker::Number.within(range: 1..10) }
    post_id { Faker::Number.within(range: 1..5) }
  end
end
