# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Profile.destroy_all
LanguageSkill.destroy_all
Lesson.destroy_all

puts "Started seeding Roles"
role1 = Role.create! :privilege => 'admin'
role2 = Role.create! :privilege => 'teacher'
role3 = Role.create! :privilege => 'student'
puts "Finished seeding Roles"


puts "Started seeding User 1"
user1 = User.create! :email => 'admin@gmail.com', :password => '123456', :password_confirmation => '123456'
puts "Assigning Role to User 1"
user1.role = Role.where(privilege: 'admin')
puts "Creating and Assigning profile for User 1"
user1.profile = Profile.create! :firstname => 'admin', :lastname => 'admin', :bio => 'I can access everything!'
user1.save!
puts "Finished seeded User 1"


puts "Started seeding User 2"
user2 = User.create! :email => 'teacher@gmail.com', :password => '123456', :password_confirmation => '123456'
puts "Assigning Role to User 2"
user2.role = Role.where(privilege: 'teacher')
puts "Creating and Assigning profile for User 2"
user2.profile = Profile.create! :firstname => 'Joe', :lastname => 'Teacher', :bio => 'I can do teacher actions'
user2.save!
puts "Creating and Assigning language skill for User 2"
user2.profile.languageskill = Languageskill.create! :language_name => 'Spanish', :proficiency => 5, :teaches => true
puts "Creating and Assigning Lesson for User 2"
user2.lesson = Lesson.create! :price => 10, :duration => 60, :description => "This is a 60 minute lesson for Spanish", :maxbooking => 6
user2.save!
puts "Finished seeded User 2"


puts "Started seeding User 3"
user3 = User.create! :email => 'student@gmail.com', :password => '123456', :password_confirmation => '123456'
puts "Assigning Role to User 3"
user3.role = Role.where(privilege: 'student')
puts "Creating and Assigning profile for User 3"
user3.profile = Profile.create! :firstname => 'Sally', :lastname => 'Student', :bio => 'I can do student actions'
user3.save!
puts "Creating and Assigning language skill for User 3"
user3.profile.languageskill = Languageskill.create! :language_name => 'Mandarin', :proficiency => 6, :teaches => false
user3.save!
puts "Finished seeded User 3"

