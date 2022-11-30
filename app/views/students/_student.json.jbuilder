json.extract! student, :id, :name, :grade, :gpa, :created_at, :updated_at
json.url student_url(student, format: :json)
