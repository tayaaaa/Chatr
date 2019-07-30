class PagesController < ApplicationController
    before_action :set_lessons

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
end
