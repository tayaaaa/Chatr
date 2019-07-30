class PagesController < ApplicationController
    before_action :set_teachers
    before_action :set_lessons
    
    def index
    @teachers_card_array = []

        @teachers.each do |teacher|
            languages_arr = teacher.profile.languageskills
            languages = []
            languages_arr.each do |languageskill|
                if(languageskill.teaches == true)
                languages << languageskill.language_name
                end
            end

            teacher_card_info = {
                :profile_id => teacher.profile.id,
                :name => teacher.profile.firstname,
                :bio => teacher.profile.bio,
                :teach_languages => languages
            }
            @teachers_card_array << teacher_card_info
        end
    end
    

    def index
        @lesson_card_array = []
        @lessons.each do |lesson|
            lesson_card_info = {
                id: lesson.id,
                language: lesson.languageskill.language_name, 
                duration: lesson.duration, 
                maxbooking: lesson.maxbooking, 
                description: lesson.description, teacher_name:lesson.user.profile.firstname, teacher_id:lesson.user_id,
                price:lesson.price}
            @lesson_card_array << lesson_card_info
        end
    end

    private
    def set_lessons
        @lessons = Lesson.all
    end

    private
    def set_teachers
        @teachers = User.where(role: Role.second)
    end

    def get_teacher_stars(teacher)
        userbookings_with_review = 0
        total_stars = 0
        teacher.lessons.each do |lesson|
            lesson.userbookings.each do |userbooking|
                if(userbooking.review)
                    userbooking_stars = userbooking.review.stars
                    total_stars += userbooking_stars
                    userbookings_with_review += 1
                end
            end
        end
        average_stars = (total_stars / (userbookings_with_review * 5.0)) * 5
    end

end
