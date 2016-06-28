class EventsController < ApplicationController

  before_action :authenticate, only: [:attend, :unattend]
  before_action :ensure_valid_and_live_event, only: [:attend, :unattend]

  def index
    @events = Event.all.order(:start_time).paginate(:page => params[:page], :per_page => 6)
  end

  def show
    @event = Event.find(params[:id])
  end

  def attend
    if @event.add_attendee(current_user)
      redirect_to event_path(@event), notice: "You have successfully purchased the ticket to the event for ₹#{ @event.get_ticket_price(current_user)}."
    else
      redirect_to event_path(@event), alert: "Sorry, we were not able to add you to the attendees list."
    end
  end

  def unattend
    if @event.remove_attendee(current_user)
      redirect_to event_path(@event), notice: "You have been successfully removed from the event attendees list."
    else
      redirect_to event_path(@event), alert: "Sorry, we were not able to remove you to the attendees list."
    end
  end

  private

  def ensure_valid_and_live_event
    @event = Event.find_by(id: params[:id])

    if @event.nil?
      redirect_to :back, alert: "Sorry, invalid event."
    elsif @event.expired?
      redirect_to event_path(@event), alert: "Sorry, the event has already taken place."
    end
  end
end
