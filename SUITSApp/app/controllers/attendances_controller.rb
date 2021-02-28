class AttendancesController < ApplicationController
  def index
    @attendances=Attendance.all
  end

  def show
    @attendance=Attendance.find(params[:id])
  end

  def user
    if current_user.gen_member? and current_user.id != params[:id].to_i
      redirect_to(:controler => "attendances", :action => "user", id: current_user)
    end
    @attendances = Attendance.where(users_id: params[:id])
  end

  def new
    @attendance = Attendance.new(:events_id => params[:events_id], :users_id => params[:users_id])
    if @attendance.save
      flash[:notice]="attendance added successfully"
      redirect_to(events_path)
    else
      flash[:notice]="an error occured"
      redirect_to :back
    end
  end

  def create
    @attendance=Attendance.new(attendance_params)
    puts @attendance.inspect
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
