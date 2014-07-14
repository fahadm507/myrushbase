namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_posts
    make_relationships
  end
end

def make_users
  User.create!(first_name: "Example ",
                       last_name: "User",
                       email: "example@fahadmukunzi.com",
                       category_id: 1,
                       password: "foobarfoobar",
                       password_confirmation: "foobarfoobar"
                       )

  99.times do |m|
    first_name  = Faker::Name.first_name
    last_name = Faker::Name.first_name
    email = "example-#{m+1}@fahadm5.org"
    password  = "password"
    User.create!(first_name: first_name,
                 last_name: last_name,
                 email:    email,
                 category_id: category_id,
                 password: password,
                 password_confirmation: password)
  end
end

def make_posts
  users = User.all(limit: 6)
  50.times do
    body = Faker::Lorem.sentence(5)
    users.each { |user| user.posts.create!(body: body) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end
