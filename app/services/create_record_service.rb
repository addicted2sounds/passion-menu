class CreateRecordService
  attr_private_initialize :record, [:serializer!]

  def call
    if record.save
      {
        json: serializer.new(record),
        status: :created
      }
    else
      notify
      {
        json: ErrorSerializer.new(record.errors),
        status: :unprocessable_entity
      }
    end
  end

  private

  def notify
  end
end