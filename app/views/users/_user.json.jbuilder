json.extract! user, :id, :google_uid, :data, :created_at, :updated_at
json.url user_url(user, format: :json)
