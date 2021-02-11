class EventsController < ApplicationController
  def index
    @events=Event.all
  end

  def show
    @event=Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event=Event.new(event_params)

    if @event.save
      flash[:notice]="Event added successfully"
      redirect_to({:action => 'index'})
    else
      render('new')
    end
  end

  def delete
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to(Events)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event =Event.find(params[:id])
    
    if @event.update(event_params)
      flash[:notice] = "Event Updated"
      redirect_to(events_path)
    else
      render('edit')
    end
  end

  def delete
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice]="'#{@event.event_name}' was deleted"
    redirect_to(events_path)
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :location, :date, :event_descripition)
  end
end
