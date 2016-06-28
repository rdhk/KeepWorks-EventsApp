module EventsHelper

  def past_or_attend_or_unattend(event)
    if event.expired?
      '<span class="label label-danger">PAST EVENT</span>'.html_safe
    elsif signed_in?
      if event.attendees.include? (current_user)
        link_to "Unattend this event", unattend_event_path(event), method: :post, class:"btn btn-danger btn-md"
      else
        link_to "Attend this event", attend_event_path(event), method: :post, class:"btn btn-success btn-md"
      end
    end
  end

end
