class AttendancesController < ApplicationController
  def index
    @attendances=Attendance.all
  end

  def show
    @attendance=Attendance.find(params[:id])
  end

  def new
    @attendance = Attendance.new(:events_id => params[:events_id], :events_passcode => params[:events_passcode], :users_id => params[:users_id], :passcode => params[:passcode])
  end

  def create
    @attendance=Attendance.new(attendance_params)
    puts @attendance.inspect
    p "in create"

    if @attendance.save && @attendance.events_passcode == @attendance.passcode
      flash[:notice]="attendance added successfully"
      p "saved"
      redirect_to(events_path)
    else
      flash[:notice]="error"
      p "not saved"
      render('new')
    end
  end

  def edit
  end

  def update
  end

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
    params.require(:attendance).permit(:events_id, :events_passcode, :users_id, :passcode)
  end
end
