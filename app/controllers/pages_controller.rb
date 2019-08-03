class PagesController < ApplicationController
    before_action :set_teachers
    before_action :set_lessons
    before_action :set_lesson_card_array
    before_action :set_teachers_card_array
    
    def landing
    end

    def index
    end

    def browse_lessons
    end

    def browse_teachers
    end
    

    private
    def set_lessons
        @lessons = Lesson.all
    end

    def set_lesson_card_array
        @lesson_card_array = []
        @lessons.each do |lesson|
            lesson_card_info = {
                language: lesson.languageskill.language_name, 
                duration: lesson.duration, 
                maxbooking: lesson.maxbooking, 
                description: lesson.description, teacher_name:lesson.user.profile.firstname, teacher_id:lesson.user_id,
                price:lesson.price}
            @lesson_card_array << lesson_card_info
        end
    end

    def set_teachers
        @teachers = User.where(role: Role.second)
    end

    def set_teachers_card_array
        @teachers_card_array = []
        @teachers.each do |teacher|
            languageskills_arr = teacher.profile.languageskills
            languages = []
            languageskills_arr.each do |languageskill|
                if(languageskill.teaches == true)
                languages << languageskill.language_name
                end
            end

            teacher_card_info = {
                :profile_id => teacher.profile.id,
                :name => teacher.profile.firstname,
                :bio => teacher.profile.bio,
                :teach_languages => languages,
                :stars => get_teacher_stars(teacher),
                # :image => teacher.profile.uploaded_image
            }
            @teachers_card_array << teacher_card_info
        end
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
        if(userbookings_with_review != 0)
            average_stars = (total_stars / (userbookings_with_review * 5.0)) * 5
        end
    end

end
