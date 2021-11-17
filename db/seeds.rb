# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

user = User.new(
  email: 'admin@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Admin',
  role: 'admin'
)
user.skip_confirmation!
user.save!

user = User.new(
  email: 'guilherme@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Guilherme'
)
user.skip_confirmation!
user.save!

user = User.new(
  email: 'gabriel@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Gabriel'
)
user.skip_confirmation!
user.save!

(1..10).each do |id|
  Post.create!(
      id: id,
      author_id: rand(1..3),
      title: Faker::Book.title,
      text: Faker::Lorem.paragraph(sentence_count: 5, supplemental: true),
      comments_counter: 0,
      likes_counter: 0,
  )
end

(1..10).each do |id|
  Comment.create!(
      id: id,
      post_id: rand(1..10),
      author_id: rand(1..3),
      text: Faker::Lorem.paragraph,
  )
end
ActiveRecord::Base.connection.tables.each do |t|
ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
