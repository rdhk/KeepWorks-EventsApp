class Event < ActiveRecord::Base

  validates :name, :venue, :start_time, presence: true
  validates_with EventTimeValidator

  has_many :event_attendees
  has_many :attendees, through: :event_attendees, class_name: "User"
  #ensure attend and unattend not happening to past events

  def expired?
    Time.current > start_time
  end

  def get_ticket_price(user)
    if user.female?
      ticket_price - (0.05 * ticket_price)
    else
      ticket_price
    end
  end

  def add_attendee(user)
    ticket_price = get_ticket_price(user)
    ea = EventAttendee.new(event: self, attendee: user, ticket_bought_for: ticket_price)
    ea.save
  end

  def remove_attendee(user)
    attendees.destroy(user)
  end

end
