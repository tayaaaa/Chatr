json.extract! lesson, :id, :user_id, :price, :duration, :description, :maxbooking, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
