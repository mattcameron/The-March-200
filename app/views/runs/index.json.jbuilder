json.array!(@runs) do |run|
  json.extract! run, :id, :distance, :date, :partners, :time, :speed
  json.url run_url(run, format: :json)
end
