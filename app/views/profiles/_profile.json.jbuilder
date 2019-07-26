json.extract! profile, :id, :user_id, :firstname, :lastname, :bio, :skypename, :created_at, :updated_at
json.url profile_url(profile, format: :json)
