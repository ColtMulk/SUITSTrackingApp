# frozen_string_literal: true

class EventsController < ApplicationController
  layout 'dashboard'

  def index
    # p params[:name]
    @events = if !params[:sort] || !params[:name]
                Event.order(:date)
              elsif params[:name] == 'name'
                Event.order(event_name: params[:sort])
              elsif params[:name] == 'location'
                Event.order(location: params[:sort])
              elsif params[:name] == 'date'
                Event.order(date: params[:sort])
              elsif params[:name] == 'open'
                Event.order(is_open: params[:sort])
              else
                if params[:sort] != "asc" and params[:sort] != "desc"
                  params[:sort] = "asc"
                end
                Event.includes(:event_type).order("event_types.name #{params[:sort]}")
              end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @event_types = EventType.all
  end

  def create
    @event = Event.new(event_params)
    @event.encrypt_passcode
    #  p @event
    if @event.save
      flash[:notice] = 'Event added successfully'
      redirect_to(events_path(@event))
    else
      flash[:notice] = 'Failure'
      #  p @event.errors.full_messages
      render('new')
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = 'Event Updated'
      redirect_to(events_path)
    else
      render('edit')
    end
  end

  def delete
    @event = Event.find(params[:id])
  end

  # def destroy
  #   @event = Event.find(params[:id])
  #   @event.destroy
  #   redirect_to(Events)
  # end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "'#{@event.event_name}' was deleted"
    redirect_to(events_path)
  end

  def select_event
    @user_info = UserInfo.find(params[:id])
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :location, :date, :event_description, :passcode,
                                  :passcode_hash, :passcode_salt, :is_open, :event_type_id)
  end
end
