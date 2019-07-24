json.extract! conversation, :id, :references, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)
