json.array!(@measurements) do |measurement|
  json.extract! measurement, :id, :weight, :fat
  json.url measurement_url(measurement, format: :json)
end
