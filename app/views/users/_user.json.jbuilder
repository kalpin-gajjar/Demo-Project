json.extract! user, :id, :user_name, :full_name, :created_at, :updated_at
json.url user_url(user, format: :json)
