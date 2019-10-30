class ErrorSerializer
  attr_private_initialize :errors

  def serialized_hash
    {
      errors: errors.messages.map do |attr, errs|
        errs.map { |err| error(attr, err) }
      end.flatten
    }
  end

  private

  def error(attr, error)
    {
      source: {
        pointer: "/data/attributes/#{attr}"
      },
      title: error,
      details: "#{attr.capitalize} #{error}"
    }
  end
end
