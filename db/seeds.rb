require 'faker'

User.destroy_all

100.times do
  User.create!( username: Faker::Internet.user_name,
                email: Faker::Internet.email,
                password: "pwd" )
end
