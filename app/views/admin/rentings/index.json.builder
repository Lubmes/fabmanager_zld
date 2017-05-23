JSON.array!(@renting) do |renting|
  JSON.extract! renting, :id, :description
  JSON.start renting.time_start
  JSON.end renting.time_end
  JSON.url event_url(event, format: :html)
end