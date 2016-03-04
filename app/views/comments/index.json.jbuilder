json.array!(@comments) do |comment|
  json.extract! comment, :id, :question_id, :answer_id, :user_id, :content
  json.url comment_url(comment, format: :json)
end
