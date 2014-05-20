json.array!(@controllers) do |controller|
  json.extract! controller, :id, :ticket
  json.url controller_url(controller, format: :json)
end
