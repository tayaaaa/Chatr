json.extract! userbooking, :id, :student_id, :lesson_id, :note, :date_booked, :completedstu, :completedteach, :created_at, :updated_at
json.url userbooking_url(userbooking, format: :json)
