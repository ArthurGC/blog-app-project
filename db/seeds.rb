# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

(1..2).each do |id|
  User.create( 
      name: Faker::Name.name,
      photo: 'Photo',
      bio: Faker::Lorem.sentence(word_count: 3, supplemental: true),
      post_counter: 0,
  )
end

(1..3).each do |id|
    Post.create(
        author_id: 1,
        title: Faker::Book.title,
        text: Faker::Lorem.paragraph,
        comments_counter: 0,
        likes_counter: 0,
    )
end

(1..3).each do |id|
    Post.create(
        author_id: 2,
        title: Faker::Book.title,
        text: Faker::Lorem.paragraph,
        comments_counter: 0,
        likes_counter: 0,
    )
end

(1..3).each do |post_id|
    (1..5).each do |id|
        Comment.create(
            post_id: post_id,
            author_id: 1,
            text: Faker::Lorem.paragraph,
        )
    end
end

(4..6).each do |post_id|
    (1..5).each do |id|
        Comment.create(
            post_id: post_id,
            author_id: 2,
            text: Faker::Lorem.paragraph,
        )
    end
end

(1..10).each do |id|
    Like.create!(
        id: id,
        author_id: rand(1..2),
        post_id: rand(1..6),
    )
end
