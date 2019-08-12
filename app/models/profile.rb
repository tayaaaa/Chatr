class Profile < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :uploaded_image
  has_one_attached :background_image
  has_many :languageskills, dependent: :destroy

  validates :firstname, :lastname, :bio, :skypename, :presence => {:message => "Please fill out this field"}


  def update_average_rating
    set_average_rating
  end

  private
  def set_average_rating
    teacher = User.find(self.user_id)
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
      self.average_rating = ((total_stars / (userbookings_with_review * 5.0)) * 5).round
      self.save!
    end
  end
  
end
