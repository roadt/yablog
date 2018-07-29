# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# make sure one user
(1..7).each do |i|
  u = User.find_or_create_by(email: "admin#{i}@localhost")  
  u.password = 'pass'
  u.save!
end



# seeeds random data
(1..100).each do |i|
  u = User.all.shuffle.first
  Article.find_or_create_by(title: "article #{i}", content: "aritlce content #{i}", user: u)
  Post.find_or_create_by(title: "post #{i}", content: "post content #{i}", user: u)
end

# comments
(1..200).each do |i|
  u = User.all.shuffle.first

  a = Article.all.shuffle[0..20].first
  a.comments.create(content: "comment #{i} on article #{a.id}", user: u)

  p = Post.all.shuffle[0..20].first
  p.comments.create(content: " comment #{i} on post #{p.id}", user: u)
end



# like
Article.all.shuffle[0..20].each do |a|
  User.all.shuffle[0..10].each do |u|
    a.likes.create(user: u)
  end
end

Post.all.shuffle[0..20].each do |a|
  User.all.shuffle[0..10].each do |u|
    a.likes.create(user: u)
  end
end
