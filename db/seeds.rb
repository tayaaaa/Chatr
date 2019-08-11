Reply.destroy_all
Review.destroy_all
Userbooking.destroy_all
Lesson.destroy_all
Languageskill.destroy_all
Profile.destroy_all
Message.destroy_all
Conversation.destroy_all
User.destroy_all
Role.destroy_all
Notification.destroy_all

#CREATE 3 ROLES:
puts "Started seeding Roles"
role1 = Role.create! :privilege => 'admin'
role2 = Role.create! :privilege => 'teacher'
role3 = Role.create! :privilege => 'student'
puts "Finished seeding Roles"

#CREATE 1 ADMIN, 5 TEACHERS AND 5 STUDENT USERS:
puts "Started seeding Users"
user2 = User.create! :email => 'teacher1@gmail.com', :password => '123456', :password_confirmation => '123456'
user3 = User.create! :email => 'teacher2@gmail.com', :password => '123456', :password_confirmation => '123456'
user4 = User.create! :email => 'teacher3@gmail.com', :password => '123456', :password_confirmation => '123456'
user5 = User.create! :email => 'teacher4@gmail.com', :password => '123456', :password_confirmation => '123456'
user6 = User.create! :email => 'teacher5@gmail.com', :password => '123456', :password_confirmation => '123456'

user7 = User.create! :email => 'student1@gmail.com', :password => '123456', :password_confirmation => '123456'
user8 = User.create! :email => 'student2@gmail.com', :password => '123456', :password_confirmation => '123456'
user9 = User.create! :email => 'student3@gmail.com', :password => '123456', :password_confirmation => '123456'
user10 = User.create! :email => 'student4@gmail.com', :password => '123456', :password_confirmation => '123456'
user11 = User.create! :email => 'student5@gmail.com', :password => '123456', :password_confirmation => '123456'
puts "Finished seeding Users"

#ASSIGNING ROLES TO USERS:
puts "Started assigning roles to Users"

user2.role_id = role2.id
user2.save!
user3.role_id = role2.id
user3.save!
user4.role_id = role2.id
user4.save!
user5.role_id = role2.id
user5.save!
user6.role = role2
user6.save!

user7.role = role3
user7.save!
user8.role_id = role3.id
user8.save!
user9.role_id = role3.id
user9.save!
user10.role_id = role3.id
user10.save!
user11.role_id = role3.id
user11.save!

puts "Finished assigning roles to Users"

#CREATE PROFILES FOR USERS:
puts "Creating and Assigning profiles for users"
user2.profile = Profile.create! :firstname => 'Tim', :lastname => 'teacher', :skypename => "@greenfrog33", :bio => 'I have a relaxed teaching style and love to go on morning runs.', :uploaded_image => open('https://chatr-app.s3-ap-southeast-2.amazonaws.com/rails-app/default-user-img.png')
user3.profile = Profile.create! :firstname => 'Tory', :lastname => 'teacher', :skypename => "@y3llowcar", :bio => 'Passionate lifelong teacher who loves to help', :uploaded_image => open('https://chatr-app.s3-ap-southeast-2.amazonaws.com/rails-app/default-user-img.png')
user4.profile = Profile.create! :firstname => 'Tamara', :lastname => 'teacher', :skypename => "@astronautbill", :bio => 'Contact me for help with grammar', :uploaded_image => open('https://chatr-app.s3-ap-southeast-2.amazonaws.com/rails-app/default-user-img.png')
user5.profile = Profile.create! :firstname => 'Terry', :lastname => 'teacher', :skypename => "@Love2Learn", :bio => 'Native arabic speaker. Let me help you with pronunciation', :uploaded_image => open('https://chatr-app.s3-ap-southeast-2.amazonaws.com/rails-app/default-user-img.png')
user6.profile = Profile.create! :firstname => 'Tara', :lastname => 'teacher', :skypename => "@goodfood19", :bio => 'I speak 9 languages fluently. I can help you learn a new one!', :uploaded_image => open('https://chatr-app.s3-ap-southeast-2.amazonaws.com/rails-app/default-user-img.png')
user7.profile = Profile.create! :firstname => 'Sarah', :lastname => 'student', :skypename => "@bluebus11", :bio => 'I love reading books and learning spanish :)', :uploaded_image => open('https://chatr-app.s3-ap-southeast-2.amazonaws.com/rails-app/default-user-img.png')
user8.profile = Profile.create! :firstname => 'Sam', :lastname => 'student', :skypename => "@oranges22", :bio => 'Stressed for my university exams!', :uploaded_image => open('https://chatr-app.s3-ap-southeast-2.amazonaws.com/rails-app/default-user-img.png')
user9.profile = Profile.create! :firstname => 'Ser', :lastname => 'student', :skypename => "@fruitsalad", :bio => "Can't wait to be fluent", :uploaded_image => open('https://chatr-app.s3-ap-southeast-2.amazonaws.com/rails-app/default-user-img.png')
user10.profile = Profile.create! :firstname => 'Sally', :lastname => 'student', :skypename => "@2cool", :bio => 'My target language is French. Native English speaker.', :uploaded_image => open('https://chatr-app.s3-ap-southeast-2.amazonaws.com/rails-app/default-user-img.png')
user11.profile = Profile.create! :firstname => 'Sonny', :lastname => 'student', :skypename => "@car_enthusiast_98", :bio => 'Looking for casual conversation partners', :uploaded_image => open('https://chatr-app.s3-ap-southeast-2.amazonaws.com/rails-app/default-user-img.png')
puts "Finished creating and Assigning profiles for users"

#ATTACH PROFILE PICS TO USERS:
puts "Attaching profile pictures to users"
file_path = Rails.root + 'app/assets/images/profilepics'
user2.profile.uploaded_image.attach(io: File.open(file_path + 'pp1.jpg'), filename: 'pp1.jpg')
user3.profile.uploaded_image.attach(io: File.open(file_path + 'pp2.jpg'), filename: 'pp2.jpg')
user4.profile.uploaded_image.attach(io: File.open(file_path + 'pp3.jpg'), filename: 'pp3.jpg')
user5.profile.uploaded_image.attach(io: File.open(file_path + 'pp4.jpg'), filename: 'pp4.jpg')
user6.profile.uploaded_image.attach(io: File.open(file_path + 'pp5.jpg'), filename: 'pp5.jpg')
user7.profile.uploaded_image.attach(io: File.open(file_path + 'pp6.jpg'), filename: 'pp6.jpg')
user8.profile.uploaded_image.attach(io: File.open(file_path + 'pp7.jpg'), filename: 'pp7.jpg')
user9.profile.uploaded_image.attach(io: File.open(file_path + 'pp8.jpg'), filename: 'pp8.jpg')
user10.profile.uploaded_image.attach(io: File.open(file_path + 'pp9.jpg'), filename: 'pp9.jpg')
user11.profile.uploaded_image.attach(io: File.open(file_path + 'pp10.jpg'), filename: 'pp10.jpg')
puts "Finished attaching profile pics to users"

#ATTACH COVER PICS TO PROFILES:
puts "Attaching cover pictures to users profiles"
file_path = Rails.root + 'app/assets/images/coverpics'
user2.profile.background_image.attach(io: File.open(file_path + 'cp1.jpg'), filename: 'cp1.jpg')
user3.profile.background_image.attach(io: File.open(file_path + 'cp2.jpg'), filename: 'cp2.jpg')
user4.profile.background_image.attach(io: File.open(file_path + 'cp3.jpg'), filename: 'cp3.jpg')
user5.profile.background_image.attach(io: File.open(file_path + 'cp4.jpg'), filename: 'cp4.jpg')
user6.profile.background_image.attach(io: File.open(file_path + 'cp5.jpg'), filename: 'cp5.jpg')
user7.profile.background_image.attach(io: File.open(file_path + 'cp6.jpg'), filename: 'cp6.jpg')
user8.profile.background_image.attach(io: File.open(file_path + 'cp7.jpg'), filename: 'cp7.jpg')
user9.profile.background_image.attach(io: File.open(file_path + 'cp8.jpg'), filename: 'cp8.jpg')
user10.profile.background_image.attach(io: File.open(file_path + 'cp9.jpg'), filename: 'cp9.jpg')
user11.profile.background_image.attach(io: File.open(file_path + 'cp10.jpg'), filename: 'cp10.jpg')
puts "Finished attaching cover pictures to users profiles"


#CREATE LANGUAGE SKILLS FOR USERS:
puts "Creating and assigning language skills for users"
lsu2_1 = Languageskill.new :language_name => 'Spanish', :proficiency => 5, :teaches => true
user2.profile.languageskills << lsu2_1
lsu2_2 = Languageskill.new :language_name => 'English', :proficiency => 10, :teaches => true
user2.profile.languageskills << lsu2_2
lsu2_3 = Languageskill.new :language_name => 'French', :proficiency => 2
user2.profile.languageskills << lsu2_3

lsu3_1 = Languageskill.new :language_name => 'Dutch', :proficiency => 10, :teaches => true
user3.profile.languageskills << lsu3_1
lsu3_2 = Languageskill.new :language_name => 'Afrikaans', :proficiency => 10, :teaches => true
user3.profile.languageskills << lsu3_2
lsu3_3 = Languageskill.new :language_name => 'Vietnamese', :proficiency => 5
user3.profile.languageskills << lsu3_3

lsu4_1 = Languageskill.new :language_name => 'Vietnamese', :proficiency => 10, :teaches => true
user4.profile.languageskills << lsu4_1
lsu4_2 = Languageskill.new :language_name => 'Russian', :proficiency => 8, :teaches => true
user4.profile.languageskills << lsu4_2

lsu5_1 = Languageskill.new :language_name => 'Arabic', :proficiency => 10, :teaches => true
user5.profile.languageskills << lsu5_1
lsu5_2 = Languageskill.new :language_name => 'English', :proficiency => 8
user5.profile.languageskills << lsu5_2

lsu6_1 = Languageskill.new :language_name => 'German', :proficiency => 8, :teaches => true
user6.profile.languageskills << lsu6_1
lsu6_2 = Languageskill.new :language_name => 'English', :proficiency => 8, :teaches => true
user6.profile.languageskills << lsu6_2
lsu6_3 = Languageskill.new :language_name => 'French', :proficiency => 8, :teaches => true
user6.profile.languageskills << lsu6_3
lsu6_4 = Languageskill.new :language_name => 'Macedonian', :proficiency => 8, :teaches => true
user6.profile.languageskills << lsu6_4
lsu6_5 = Languageskill.new :language_name => 'Greek', :proficiency => 8, :teaches => true
user6.profile.languageskills << lsu6_5
lsu6_6 = Languageskill.new :language_name => 'Burmese', :proficiency => 8, :teaches => true
user6.profile.languageskills << lsu6_6


lsu7_1 = Languageskill.new :language_name => 'Spanish', :proficiency => 5
user7.profile.languageskills << lsu7_1
lsu7_2 = Languageskill.new :language_name => 'English', :proficiency => 10
user7.profile.languageskills << lsu7_2
lsu7_3 = Languageskill.new :language_name => 'French', :proficiency => 2
user7.profile.languageskills << lsu7_3

lsu8_1 = Languageskill.new :language_name => 'Arabic', :proficiency => 5
user8.profile.languageskills << lsu8_1
lsu8_2 = Languageskill.new :language_name => 'French', :proficiency => 6
user8.profile.languageskills << lsu8_2
lsu8_3 = Languageskill.new :language_name => 'Swedish', :proficiency => 10
user8.profile.languageskills << lsu8_3

lsu9_1 = Languageskill.new :language_name => 'Pashto', :proficiency => 10
user9.profile.languageskills << lsu9_1
lsu9_2 = Languageskill.new :language_name => 'English', :proficiency => 7
user9.profile.languageskills << lsu9_2

lsu10_1 = Languageskill.new :language_name => 'Vietnamese', :proficiency => 10
user10.profile.languageskills << lsu10_1
lsu10_2 = Languageskill.new :language_name => 'Greek', :proficiency => 5
user10.profile.languageskills << lsu10_2

lsu11_1 = Languageskill.new :language_name => 'French', :proficiency => 8
user11.profile.languageskills << lsu11_1
puts "Finished creating and assigning language skills for users"

#CREATE LESSONS FOR TEACHERS:
puts "Creating and assigning lessons for teachers"
lesson2_1 = Lesson.new :price => 50, :duration => 120, :description => "I will take a conversational tone and teach you greetings and slang. Best suited for beginners to intermediate learners.", :maxbooking => 10, :languageskill_id => user2.profile.languageskills.first.id
user2.lessons << lesson2_1
lesson2_2 = Lesson.new :price => 30, :duration => 60, :description => "1 hour of unstructured english conversation to increase your comfort speaking with natives.", :maxbooking => 10, :languageskill_id => user2.profile.languageskills.second.id
user2.lessons << lesson2_2

lesson4_1 = Lesson.new :price => 50, :duration => 120, :description => "Learn Vietnamese slang and I will assign you some homework tasks!", :maxbooking => 10, :languageskill_id => user4.profile.languageskills.first.id
user4.lessons << lesson4_1
lesson4_2 = Lesson.new :price => 20, :duration => 30, :description => "30 minutes to practise speaking with casual conversation.", :maxbooking => 10, :languageskill_id => user4.profile.languageskills.first.id
user4.lessons << lesson4_2
lesson4_3 = Lesson.new :price => 30, :duration => 45, :description => "Get to know the basics about russian culture and phrases you will need to know as a tourist.", :maxbooking => 10, :languageskill_id => user4.profile.languageskills.second.id
user4.lessons << lesson4_3
lesson4_4 = Lesson.new :price => 20, :duration => 30, :description => "30 minutes to practise speaking with casual conversation.", :maxbooking => 10, :languageskill_id => user4.profile.languageskills.second.id
user4.lessons << lesson4_4


lesson5_1 = Lesson.new :price => 100, :duration => 120, :description => "I have a skill for helping people learn arabic pronounciation. This lesson is perfect if you are an intermediate learner who needs a bit of a hand with this.", :maxbooking => 10, :languageskill_id => user5.profile.languageskills.first.id
user5.lessons << lesson5_1
lesson5_2 = Lesson.new :price => 30, :duration => 60, :description => "For complete beginners - your introduction to Arabic.", :maxbooking => 10, :languageskill_id => user5.profile.languageskills.first.id
user5.lessons << lesson5_2
lesson5_3 = Lesson.new :price => 20, :duration => 20, :description => "I will allocate 20 minutes to correct and give you feedback on your homework or assignment.", :maxbooking => 10, :languageskill_id => user5.profile.languageskills.first.id
user5.lessons << lesson5_3
lesson5_4 = Lesson.new :price => 30, :duration => 60, :description => "Basic Intermediate lesson. Will work on a topic of your choice.", :maxbooking => 10, :languageskill_id => user5.profile.languageskills.first.id
user5.lessons << lesson5_4

lesson6_1 = Lesson.new :price => 20, :duration => 45, :description => "Lean numbers in german!", :maxbooking => 10, :languageskill_id => user6.profile.languageskills.first.id
user6.lessons << lesson6_1
lesson6_2 = Lesson.new :price => 30, :duration => 60, :description => "Beginner lesson - available in many languages. We will cover pronounciation and basic phrases.", :maxbooking => 10, :languageskill_id => user6.profile.languageskills.second.id
user6.lessons << lesson6_2
lesson6_3 = Lesson.new :price => 60, :duration => 120, :description => "Learn about French culture and food with me!", :maxbooking => 10, :languageskill_id => user6.profile.languageskills.third.id
user6.lessons << lesson6_3
lesson6_4 = Lesson.new :price => 30, :duration => 60, :description => "Basic Intermediate lesson. Will work on a topic of your choice.", :maxbooking => 10, :languageskill_id => user6.profile.languageskills.fourth.id
user6.lessons << lesson6_4
lesson6_5 = Lesson.new :price => 20, :duration => 20, :description => "I will allocate 20 minutes to correct and give you feedback on your homework or assignment.", :maxbooking => 10, :languageskill_id => user6.profile.languageskills.fifth.id
user6.lessons << lesson6_5
lesson6_6 = Lesson.new :price => 30, :duration => 60, :description => "Basic Intermediate lesson. We will work on a topic of your choice.", :maxbooking => 10, :languageskill_id => user6.profile.languageskills.last.id
user6.lessons << lesson6_6
puts "Finished creating and assigning lessons for teachers"

# #CREATE USERBOOKINGS FOR LESSONS:
puts "Creating some user bookings for lessons"
    # USER 7
user7.userbookings << Userbooking.new(:lesson_id => user2.lessons.first.id, :note => "I am a beginner and looking for help with my spoken accuracy", :date_booked => "2019-02-05 04:37:12", :completedstu => true , :amountpaid => 50)
user7.userbookings << Userbooking.new(:lesson_id => user6.lessons.third.id, :note => "Hi! I would love to focus a bit more on understanding a Canadian French accent and I have some questions about plurals.", :date_booked => "2019-03-05 04:37:12", :completedstu => true , :amountpaid => 60)
user7.userbookings << Userbooking.new(:lesson_id => user6.lessons.third.id, :note => "Hey! Could we please focus on Northern French this lesson?", :date_booked => "2019-09-09 04:37:12", :amountpaid => 60)
user7.userbookings << Userbooking.new(:lesson_id => user6.lessons.third.id, :note => "My exam is next week - could we go through some of those topics?", :date_booked => "2019-09-18 04:37:12", :completedstu => true , :amountpaid => 60)
    # USER 8
user8.userbookings << Userbooking.new(:lesson_id => user5.lessons.first.id, :note => "This is my first session with you, excited to meet you!", :date_booked => "2019-01-02 04:37:12", :completedstu => true , :amountpaid => 100)
user8.userbookings << Userbooking.new(:lesson_id => user5.lessons.third.id, :note => "Can you please mark my speech and give me feedback on how I sound while reading it?", :date_booked => "2019-05-04 04:37:12", :completedstu => true , :amountpaid => 20)
user8.userbookings << Userbooking.new(:lesson_id => user5.lessons.fourth.id, :note => "I would love to focus on words related to celebrations", :date_booked => "2019-10-09 04:37:12", :amountpaid => 30)
user8.userbookings << Userbooking.new(:lesson_id => user5.lessons.third.id, :note => "I'm struggling a lot with my listening skills. Please help me with this!", :date_booked => "2019-08-01 04:37:12", :completedstu => true , :amountpaid => 20)
    # user 9
user9.userbookings << Userbooking.new(:lesson_id => user2.lessons.last.id, :note => "I need help with english numbers.", :date_booked => "2018-12-11 04:37:12", :amountpaid => 100)
    # user 10
user10.userbookings << Userbooking.new(:lesson_id => user6.lessons.third.id, :note => "I am travelling to France next week, please give me a crash course in basic phrases.", :completedstu => true, :date_booked => "2019-06-08 04:37:12", :amountpaid => 20)
puts "Finished creating user bookings for lessons"

# WRITE REVIEWS FOR COMPLETED BOOKINGS
puts "Creating reviews for some user bookings."
user10.userbookings.last.review = Review.new(:stars => 5, :content => "Tara was amazing and made it so easy for me to pick up on the basics of French! I would highly reccomend her as a teacher.", :date_published => "2019-06-10 04:37:12" )

user8.userbookings.first.review = Review.new(:stars => 4, :content => "This lesson helped me SO much with my speech! I did so well thanks to this tutor's help. However, I think the teacher could have been a bit more prepared for the lesson.", :date_published => "2019-06-10 04:37:12" )
user8.userbookings.second.review = Review.new(:stars => 5, :content => "Great experience my first time booking this teacher for a lesson. Loved it and will be booking again.", :date_published => "2019-06-10 04:37:12" )
user8.userbookings.fourth.review = Review.new(:stars => 5, :content => "So happy that I made a second booking. Terry is a great teacher and really knows how to connect to you. He is friendly and approachable, so I don't feel afraid of making mistakes when I have lessons with him.", :date_published => "2019-06-10 04:37:12" )

user7.userbookings.first.review = Review.new(:stars => 3, :content => "Fairly okay lesson, but could have been more interesting if the teacher had added some visual aids.", :date_published => "2019-06-10 04:37:12" )
user7.userbookings.second.review = Review.new(:stars => 4, :content => "Decent class! I learnt a lot from this teacher.", :date_published => "2019-06-10 04:37:12" )
user7.userbookings.fourth.review = Review.new(:stars => 2, :content => "This is the second time I have booked this lesson, however it was very dissapointing this time.", :date_published => "2019-06-10 04:37:12" )
puts "Finished creating reviews for some user bookings."

# WRITE REPLIES FOR PUBLISHED REVIEWS
#<Reply id: nil, review_id: nil, content: nil, date_published: nil, created_at: nil, updated_at: nil>
puts "Creating replies for some user reviews."
user10.userbookings.last.review.reply = Reply.new(:content => "Thankyou for your kind review!")

user8.userbookings.first.review.reply = Reply.new(:content => "Thanks for your feedback, I'm glad you learnt a lot! I will keep that in mind and have more material ready to go next time.")
user8.userbookings.second.review.reply = Reply.new(:content => "So happy I could help you out, you were very puntual, listened well and an all around amazing student!")

user7.userbookings.first.review.reply = Reply.new(:content => "That's a great suggestion! I will add more interactive elements to my lessons next time.")
user7.userbookings.second.review.reply = Reply.new(:content => "So happy to hear that. Feel free to contact me with questions at any time")
user7.userbookings.fourth.review.reply = Reply.new(:content => "I'm so sorry to hear you were so dissapointed in the lesson. I would like to offer you compensation for your experience, please message me privately.")

puts "Finished creating replies for some user reviews."