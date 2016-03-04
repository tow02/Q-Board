json.array!(@questions) do |question|
  json.extract! question, :id, :user_id, :room_subject_id, :title, :content, :total_vote, :total_star
  json.url question_url(question, format: :json)
end
