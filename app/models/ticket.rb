class Ticket < ActiveRecord::Base
  
  before_save :ensure_future_event

  belongs_to :event
  belongs_to :attendee, class_name:"User", foreign_key: "user_id"

  def ensure_future_event
    !event.expired?
  end
end
