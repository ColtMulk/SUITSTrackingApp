# frozen_string_literal: true

class UserInfosController < ApplicationController
  layout 'dashboard'

  before_action :set_user_info, only: %i[show edit update destroy]

  # GET /user_infos or /user_infos.json
  def index
    @user_infos = UserInfo.order('last_name ASC, first_name')
  end

  # GET /user_infos/1 or /user_infos/1.json
  def show
    redirect_to(controller: 'user_infos', action: 'show', id: current_user) if current_user.user_info.gen_member? && (current_user.id != params[:id].to_i)
    @user_info = UserInfo.find_by(user: params[:id])
  end

  # GET /user_infos/new
  def new
    @user_info = UserInfo.new
  end

  # GET /user_infos/1/edit
  def edit
    @user_info = UserInfo.find(params[:id])
    @user = User.find_by(user_info: @user_info)
  end

  # POST /user_infos or /user_infos.json
  def create
    @user_info = UserInfo.new(user_info_params)

    respond_to do |format|
      if UserInfo.save(@user_info)
        format.html { redirect_to @user_info, notice: 'User info was successfully created.' }
        format.json { render :show, status: :created, location: @user_info }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_infos/1 or /user_infos/1.json
  def update
    respond_to do |format|
      if @user_info.update(user_info_params)
        format.html { redirect_to user_profile_path, notice: 'User info was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_info }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_infos/1 or /user_infos/1.json
  def destroy
    @user_info.destroy
    respond_to do |format|
      format.html { redirect_to user_infos_url, notice: 'User info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def admins
    @admins = UserInfo.where(role: :admin)
  end

  def remove_admin
    set_user_info
    @user_info.update(role: :gen_member)
    redirect_to :admins
  end

  def add_admin
    set_user_info
    @user_info.user.role = :admin
  end

  def select_user
    @event = Event.find(params[:id])
    @user_infos = UserInfo.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_info
    @user_info = UserInfo.find_by(user: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_info_params
    params.require(:user_info).permit(:first_name, :last_name, :member_status, :member_category_id)
  end
end
