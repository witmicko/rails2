json.array!(@strength_activities) do |strength_activity|
  json.extract! strength_activity, :id, :type, :weight, :sets, :reps
  json.url strength_activity_url(strength_activity, format: :json)
end
