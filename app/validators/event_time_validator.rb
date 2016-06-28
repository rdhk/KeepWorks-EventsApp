class EventTimeValidator < ActiveModel::Validator

  def validate(record)
    if (record.end_time.present? && record.start_time.present? && (record.end_time < record.start_time))
      record.errors[:end_time] << "can't be before the start time."
    end
  end

end
