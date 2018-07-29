# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# make sure one user
(1..3).each do |i|
  u = User.find_or_create_by(email: "admin#{i}@localhost")  
  u.password = 'pass'
  u.save!
end



# seeeds random data
(1..100).each do |i|
  u = User.all.shuffle.first
  Article.find_or_create_by(title: "title #{i}", content: "content #{i}", user: u)
  Post.find_or_create_by(title: "title #{i}", content: "content #{i}", user: u)
end


# like
Article.all.shuffle[0..20].each do |a|
  User.all.shuffle[0..10].each do |u|
    a.likes.create(user: u)
  end
end
