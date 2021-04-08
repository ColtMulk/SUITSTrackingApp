# frozen_string_literal: true

class EventsController < ApplicationController
  layout 'dashboard'

  def index
    @events = Event.all
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
    et = EventType.find_by name: params[:event][:event_type]
    @event.event_type_id = et.id
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

    @event.encrypt_passcode
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
                                  :passcode_hash, :passcode_salt, :is_open)
  end
end
