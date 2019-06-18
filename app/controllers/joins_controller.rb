class JoinsController < ApplicationController
	before_action :set_event
  #def create
  	#event = Event.find(params[:event_id])
    #join = current_user.joins.new(event_id: event.id)
    #join.save
    #redirect_to event_path(event)
  #end
  def create
    @join =Join.create(user_id: current_user.id, event_id: params[:event_id])
    @joins = Join.where(event_id: params[:event_id])
    @event.reload
  end

  #def destroy
  	#event = Event.find(params[:event_id])
    #join = current_user.joins.find_by(event_id: event.id)
    #join.destroy
    #redirect_to event_path(event)
  #end
  def destroy
    join =Join.find_by(user_id: current_user.id, event_id: params[:event_id])
    join.destroy
    @joins = Join.where(event_id: params[:event_id])
    @event.reload
  end

  private
  def set_event
  	@event = Event.find(params[:event_id])
  end

end
