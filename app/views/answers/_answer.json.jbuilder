json.extract! answer, :id, :user_id, :question_id, :vote_score, :up_vote, :down_vote, :answer_context, :answer_body, :created_at, :updated_at
json.url answer_url(answer, format: :json)
