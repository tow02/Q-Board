json.array!(@answers) do |answer|
  json.extract! answer, :id, :question_id, :user_id, :content, :total_vote, :is_accepted
  json.url answer_url(answer, format: :json)
end
