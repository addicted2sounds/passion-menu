# frozen_string_literal: true

RSpec::Matchers.define :serialize_resource do |resource, **options|
  match do |response|
    serialized = serialized_json(resource, options[:with])
    json.values_at(*serialized.keys) == serialized.values
  end

  failure_message do |response|
    expected = serialized_json(resource, options[:with])
    "expected response body #{expected.inspect}, got #{json.inspect}"
  end

  def json
    JSON.parse(response.body)
  end

  def serialized_json(resource, serializeable_klass)
    serializeable_klass.new(resource).as_json
  end
end
