class PagesController < ApplicationController
    before_action :set_teachers
    before_action :set_lessons
    before_action :set_teachers_card_array
    
    def landing
    end

    def index
        set_lesson_card_array(@lessons)
    end

    def browse_lessons 
        @lessons = Lesson.lessons_by_language(params[:search_lang]) if params[:search_lang].present?
        set_lesson_card_array(@lessons)
    end

    def browse_teachers
    end

    private
    def set_lessons
        @lessons = Lesson.all
    end

    def set_lesson_card_array(lessons)
        @lesson_card_array = []
        lessons.each do |lesson|
            lesson_card_info = {
                language: lesson.languageskill.language_name, 
                duration: lesson.duration, 
                maxbooking: lesson.maxbooking, 
                description: lesson.description,
                teacher_name:lesson.user.profile.firstname,
                teacher_id:lesson.user_id,
                price:lesson.price,
                id: lesson.id,    
                profilepic: lesson.user.profile.uploaded_image
            }
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
                :stars => teacher.profile.average_rating,
                :image => teacher.profile.uploaded_image
            }
            @teachers_card_array << teacher_card_info
        end
    end
end
