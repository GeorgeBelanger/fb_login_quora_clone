json.extract! question, :id, :user_id, :vote_score, :up_vote, :down_vote, :num_answers, :question_title, :question_body, :created_at, :updated_at
json.url question_url(question, format: :json)
