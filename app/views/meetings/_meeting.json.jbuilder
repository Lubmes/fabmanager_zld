json.extract! meeting, :id, :rails, :g, :scaffold, :Meeting, :name, :start_time, :end_time, :agenda, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)