class EventsController < ApplicationController
  def index
    @events = Event.all.order(:start_time).paginate(:page => params[:page], :per_page => 6)
  end

  def show
    @event = Event.find(params[:id])
  end
end
