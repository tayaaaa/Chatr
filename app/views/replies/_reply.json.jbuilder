json.extract! reply, :id, :review_id, :content, :date_published, :created_at, :updated_at
json.url reply_url(reply, format: :json)
