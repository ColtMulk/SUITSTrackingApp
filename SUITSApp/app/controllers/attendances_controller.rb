# frozen_string_literal: true

class AttendancesController < ApplicationController
  layout 'dashboard'

  def index
    # p params[:name]
    params[:sort] = nil if params[:sort] != 'desc' && params[:sort] != 'asc'

    @attendances = if !params[:sort] || !params[:name]
                     Attendance.includes(:user_info).order('user_infos.last_name desc')
                   elsif params[:name] == 'EventName'
                     Attendance.includes(:events).order("events.event_name #{params[:sort]}")
                   else
                     Attendance.includes(:user_info).order("user_infos.last_name #{params[:sort]}, user_infos.first_name #{params[:sort]}")
                   end
  end

  def show
    @attendance = Attendance.find(params[:id])
  end

  def user
    redirect_to(controller: 'attendances', action: 'user', id: current_user) if current_user.user_info.gen_member? && (current_user.id != params[:id].to_i)
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
    # puts attendance_params
    # puts @attendance.inspect
    # p 'in create'

    # p @attendance.user_passcode;
    if Attendance.exists?(users_id: current_user, events_id: @attendance.events_id)
      render('duplicate')
    elsif !current_user.user_info.gen_member? || @attendance.authenticate(@attendance.user_passcode, @attendance.events_passcode_hash)
      if @attendance.save!
        flash[:notice] = 'attendance added successfully'
        p 'saved'
        redirect_to(dashboard_index_path)
      else
        flash[:notice] = 'Error: Not Saved'
        #  p 'not saved'
        render('new')
      end
    # p "correct password"
    else
      p 'incorrect password'
      flash[:notice] = 'Incorrect Passcode'
      render('new')
    end
  end

  def duplicate; end

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
