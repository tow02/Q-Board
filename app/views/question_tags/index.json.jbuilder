json.array!(@question_tags) do |question_tag|
  json.extract! question_tag, :id, :question_id, :tag_id
  json.url question_tag_url(question_tag, format: :json)
end
