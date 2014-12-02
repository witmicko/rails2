json.array!(@fitness_activities) do |fitness_activity|
  json.extract! fitness_activity, :id, :type, :distance, :heart_rate, :calories, :duration
  json.url fitness_activity_url(fitness_activity, format: :json)
end
