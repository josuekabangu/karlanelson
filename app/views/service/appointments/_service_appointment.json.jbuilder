json.extract! service_appointment, :id, :date, :user_id, :created_at, :updated_at
json.url service_appointment_url(service_appointment, format: :json)
