json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :teacher_id, :name, :date_due
  json.url assignment_url(assignment, format: :json)
end
