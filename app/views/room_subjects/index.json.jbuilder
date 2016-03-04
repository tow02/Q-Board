json.array!(@room_subjects) do |room_subject|
  json.extract! room_subject, :id, :name
  json.url room_subject_url(room_subject, format: :json)
end
