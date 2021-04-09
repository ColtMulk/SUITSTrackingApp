class AttendancesController < ApplicationController
  layout 'dashboard'

  def index
    p params[:name]
    if !params[:sort] or !params[:name]
      @attendances = Attendance.includes(:user_info).order("user_infos.last_name desc")
    elsif params[:name] == "EventName"
      @attendances = Attendance.includes(:events).order("events.event_name " + params[:sort])
    elsif params[:name] == "location"
      @attendances = Event.order(location: params[:sort])
    elsif params[:name] == "date"
      @attendances = Event.order(date: params[:sort])
    else
      @attendances = Event.includes(:event_type).order("event_types.name " + params[:sort])
    end
  end

  def show
    @attendance = Attendance.find(params[:id])
  end

  def user
    if current_user.gen_member? && (current_user.id != params[:id].to_i)
      redirect_to(controller: 'attendances', action: 'user', id: current_user)
    end
    @attendances = Attendance.where(users_id: params[:id])
  end

  def new
    @attendance = Attendance.new(users_id: params[:users_id],
                                 events_passcode_hash: params[:events_passcode_hash],
                                 events_id: params[:events_id],
                                 user_passcode: params[:user_passcode])
  end

  def create
    @attendance = Attendance.new(attendance_params)
    puts attendance_params
    puts @attendance.inspect
    p 'in create'

    p @attendance.user_passcode;

    if !current_user.gen_member? or @attendance.authenticate(@attendance.user_passcode, @attendance.events_passcode_hash)
      p "correct password"
      if @attendance.save!
        flash[:notice] = 'attendance added successfully'
        p 'saved'
        redirect_to(events_path)
      else
        flash[:notice] = 'Error: Not Saved'
        p 'not saved'
        render('new')
      end
    else
      p "incorrect password"
      flash[:notice] = 'Incorrect Passcode'
      render('new')
    end
  end

  def edit; end

  def update; end

  def delete
    @attendance = Attendance.find(params[:id])
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy
    redirect_to(events_path)
  end

  private

  def attendance_params
    params.require(:attendance).permit(:events_id, :events_passcode_hash, :users_id, :user_passcode)
  end
end
