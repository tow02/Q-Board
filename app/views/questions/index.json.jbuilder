json.array!(@questions) do |question|
  json.extract! question, :id, :user_id, :room_id, :title
  json.url question_url(question, format: :json)
end
