json.array!(@weapons) do |weapon|
  json.extract! weapon, :id, :name, :description
  json.url weapon_url(weapon, format: :json)
end
