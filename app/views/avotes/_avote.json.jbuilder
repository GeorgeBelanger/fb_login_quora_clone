json.extract! avote, :id, :upvote, :user_id, :answer_id, :created_at, :updated_at
json.url avote_url(avote, format: :json)
