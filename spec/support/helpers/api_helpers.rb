module ApiHelpers
  def json
    JSON.parse response.body
  end

  def response_data
    json['data']
  end
end