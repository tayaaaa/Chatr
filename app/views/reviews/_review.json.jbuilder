json.extract! review, :id, :userbooking_id, :stars, :content, :date_published, :created_at, :updated_at
json.url review_url(review, format: :json)
