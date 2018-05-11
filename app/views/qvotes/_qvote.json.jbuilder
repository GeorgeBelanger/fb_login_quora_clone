json.extract! qvote, :id, :upvote, :user_id, :question_id, :created_at, :updated_at
json.url qvote_url(qvote, format: :json)
