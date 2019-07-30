json.extract! message, :id, :references, :content, :date_sent, :references, :created_at, :updated_at
json.url message_url(message, format: :json)
