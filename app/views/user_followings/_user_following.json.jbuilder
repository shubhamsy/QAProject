json.extract! user_following, :id, :user_id, :follow_id, :question_id, :created_at, :updated_at
json.url user_following_url(user_following, format: :json)
