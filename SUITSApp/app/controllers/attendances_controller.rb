class AttendancesController < ApplicationController
  def index
    @attendances=Attendance.all
  end

  def show
    @attendance=Attendance.find(params[:id])
  end

  def new
    @attendance = Attendance.new
  end

  def create
    @attendance=Attendance.new(attendance_params)
    puts @attendance.insepect
    p "in create"

    if @attendance.save
      flash[:notice]="attendance added successfully"
      p "saved"
      redirect_to(events_path)
    else
      flash[:notice]="an error occured"
      p "not saved"
      render('new')
    end
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
    params.require(:attendance).permit(:events_id, :users_id)
  end
end
