# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Languageskill.destroy_all
Profile.destroy_all
Lesson.destroy_all
User.destroy_all
Role.destroy_all

puts "Started seeding Roles"
role1 = Role.create! :privilege => 'admin'
role2 = Role.create! :privilege => 'teacher'
role3 = Role.create! :privilege => 'student'
puts "Finished seeding Roles"


puts "Started seeding User 1: ADMIN"
user1 = User.create! :email => 'admin1@gmail.com', :password => '123456', :password_confirmation => '123456'
puts "Assigning Role to User 1"
user1.role = Role.where(privilege: 'admin')[0]
puts "Creating and Assigning profile for User 1"
user1.profile = Profile.create! :firstname => 'admin1', :lastname => 'admin1', :bio => 'I can access everything!'
user1.save!
puts "Finished seeded User 1"


puts "Started seeding User 2: TEACHER"
user2 = User.create! :email => 'teacher1@gmail.com', :password => '123456', :password_confirmation => '123456'
puts "Assigning Role to User 2"
user2.role = Role.where(privilege:'teacher')[0]
puts "Creating and Assigning profile for User 2"
user2.profile = Profile.create! :firstname => 'Joe', :lastname => 'Teacher1', :bio => 'I can do teacher actions'
user2.save!
puts "Creating and Assigning language skill for User 2"
language_skill1_u2 = Languageskill.create! :language_name => 'Spanish', :proficiency => 5, :teaches => true
user2.profile.languageskills << language_skill1_u2
puts "Creating and Assigning Lesson for User 2"
lesson1_u2 = Lesson.create! :price => 10, :duration => 60, :description => "This is a 60 minute lesson for Spanish", :maxbooking => 6
user2.lessons << lesson1_u2
user2.save!
puts "Finished seeded User 2"


puts "Started seeding User 3: STUDENT"
user3 = User.create! :email => 'student1@gmail.com', :password => '123456', :password_confirmation => '123456'
puts "Assigning Role to User 3"
user3.role = Role.where(privilege:'student')[0]
puts "Creating and Assigning profile for User 3"
user3.profile = Profile.create! :firstname => 'Sally', :lastname => 'Student1', :bio => 'I can do student actions'
user3.save!
puts "Creating and Assigning language skill for User 3"
language_skill1_u3 = Languageskill.create! :language_name => 'Mandarin', :proficiency => 6, :teaches => false
user3.profile.languageskills << language_skill1_u3
user3.save!
puts "Finished seeded User 3"


puts "Started seeding User 4: TEACHER"
user4 = User.create! :email => 'teacher2@gmail.com', :password => '123456', :password_confirmation => '123456'
puts "Assigning Role to User 4"
user4.role = Role.where(privilege:'teacher')[0]
puts "Creating and Assigning profile for User 4"
user4.profile = Profile.create! :firstname => 'Joe', :lastname => 'Teacher2', :bio => 'I can do teacher actions'
user4.save!
puts "Creating and Assigning language skill for User 4"
language_skill1_u4 = Languageskill.create! :language_name => 'French', :proficiency => 7, :teaches => true
user4.profile.languageskills << language_skill1_u4
puts "Creating and Assigning Lesson for User 4"
lesson1_u4 = Lesson.create! :price => 20, :duration => 120, :description => "This is a 60 minute lesson for French", :maxbooking => 6
user4.lessons << lesson1_u4
user4.save!
puts "Finished seeded User 4"


puts "Started seeding User 5: STUDENT"
user5 = User.create! :email => 'student2@gmail.com', :password => '123456', :password_confirmation => '123456'
puts "Assigning Role to User 5"
user5.role = Role.where(privilege:'student')[0]
puts "Creating and Assigning profile for User 5"
user5.profile = Profile.create! :firstname => 'Sally', :lastname => 'Student2', :bio => 'I can do student actions'
user5.save!
puts "Creating and Assigning language skill for User 5"
language_skill1_u5 = Languageskill.create! :language_name => 'Mandarin', :proficiency => 6, :teaches => false
user5.profile.languageskills << language_skill1_u5
user5.save!
puts "Finished seeded User 5"

puts "End of seeding"

